extends Control

const Hand = preload("res://scripts/constants/hand.gd").Hand
const FingeredNote = preload("res://scripts/models/fingered_note.gd")
const NotePosition = preload("res://scripts/models/note_position.gd")

# Signals
signal clear_highlighted_keys
signal exercise_sequence_created(sequence: PracticeSequence)
signal sequence_updated(current_position: int)
signal sequence_completed
signal note_validated(success: bool)
signal highlight_note_by_name(note_name: String, hand: Hand)
signal unhighlight_note_by_name(note_name: String)
signal clear_finger_indicators
signal add_finger_indicator(note: FingeredNote, is_current: bool)

# Node references
@onready var hand_dropdown = $HBoxContainer/HandDropdown
@onready var exercise_type_dropdown = $HBoxContainer/ExerciseTypeDropdown
@onready var music_key_dropdown = $HBoxContainer/KeyDropdown

# Load exercises
@onready var scales = preload("res://scripts/exercises/scales_major.gd").new()
@onready var chords = preload("res://scripts/exercises/chords_major.gd").new()
@onready var major_arpeggios = preload("res://scripts/exercises/arpeggios_major.gd").new()
@onready var minor_arpeggios = preload("res://scripts/exercises/arpeggios_minor.gd").new()

# State tracking variables
var current_sequence: PracticeSequence # The current exercise sequence
var current_position: int = 0 # Current position in the sequence
var played_notes: Dictionary = {} # Tracks which notes have been played in current chord

func _ready():
	hand_dropdown.connect("item_selected", _on_hand_selected)
	exercise_type_dropdown.connect("item_selected", _on_exercise_type_selected)
	music_key_dropdown.connect("item_selected", _on_key_selected)
	_initialize_dropdowns()
	call_deferred("_update_exercise")

func _initialize_dropdowns():
	# Initialize hand selection
	hand_dropdown.clear()
	hand_dropdown.add_item("Right Hand")
	hand_dropdown.add_item("Left Hand")
	
	# Initialize exercise types
	exercise_type_dropdown.clear()
	exercise_type_dropdown.add_item("Scales")
	exercise_type_dropdown.add_item("Chords")
	exercise_type_dropdown.add_item("Major Arpeggios")
	exercise_type_dropdown.add_item("Minor Arpeggios")
	
	_update_key_dropdown()

func _update_key_dropdown():
	music_key_dropdown.clear()
	for key in MusicalConstants.MusicKey.values():
		music_key_dropdown.add_item(MusicalConstants.MUSIC_KEY_STRINGS[key])

func _on_exercise_type_selected(index):
	_update_key_dropdown()
	_update_exercise()

func _on_key_selected(index):
	_update_exercise()

func _on_hand_selected(index):
	_update_exercise()

func _update_exercise():
	emit_signal("clear_highlighted_keys")
	
	var exercise_type_str = exercise_type_dropdown.get_item_text(exercise_type_dropdown.selected)
	var exercise_type: PracticeSequence.ExerciseType

	if exercise_type_str == "Scales":
		exercise_type = PracticeSequence.ExerciseType.SCALES
	elif exercise_type_str == "Chords":
		exercise_type = PracticeSequence.ExerciseType.CHORDS
	elif exercise_type_str == "Major Arpeggios":
		exercise_type = PracticeSequence.ExerciseType.MAJOR_ARPEGGIOS
	elif exercise_type_str == "Minor Arpeggios":
		exercise_type = PracticeSequence.ExerciseType.MINOR_ARPEGGIOS
	else:
		exercise_type = PracticeSequence.ExerciseType.SCALES
	
	var music_key_str = music_key_dropdown.get_item_text(music_key_dropdown.selected)
	var music_key = null
	for key in MusicalConstants.MusicKey.values():
		if MusicalConstants.MUSIC_KEY_STRINGS[key] == music_key_str:
			music_key = key
			break
	
	var hand = Hand.RIGHT_HAND if hand_dropdown.get_item_text(hand_dropdown.selected).begins_with("Right") else Hand.LEFT_HAND

	var exercises = {
		PracticeSequence.ExerciseType.SCALES: "create_scale",
		PracticeSequence.ExerciseType.CHORDS: "create_chord_inversions",
		PracticeSequence.ExerciseType.MAJOR_ARPEGGIOS: "create_major_arpeggios",
		PracticeSequence.ExerciseType.MINOR_ARPEGGIOS: "create_minor_arpeggios"
	}
	
	if exercises.has(exercise_type):
		var exercise_method = exercises[exercise_type]
		var exercise_sequence = self.call(exercise_method, music_key, hand)
		set_sequence(exercise_sequence)

# Set a new sequence and reset state
func set_sequence(sequence: PracticeSequence):
	if not sequence:
		push_error("Attempted to set null sequence")
		return
		
	current_sequence = sequence
	current_position = 0
	played_notes.clear() # Reset played notes tracking
	
	update_display()
	highlight_current_note()

# Validate an array of MIDI notes against current chord
func validate_input(midi_notes: Array[int]) -> bool:
	if not current_sequence or current_position >= current_sequence.sequence.size():
		return false
	
	var current_notes = current_sequence.sequence[current_position].notes
	# First validate that all played notes are part of the expected chord
	for midi_note in midi_notes:
		var note_valid = false
		for expected_note in current_notes:
			var expected_midi = note_name_to_midi(expected_note.pitch)
			if expected_midi == midi_note and not played_notes.has(expected_midi):
				note_valid = true
				played_notes[expected_midi] = true
				break
		
		if not note_valid:
			return false
	
	# Then check if all required notes for the chord have been played
	var all_notes_played = true
	var missing_notes = []
	for chord_note in current_notes:
		var chord_midi = note_name_to_midi(chord_note.pitch)
		if not played_notes.has(chord_midi):
			all_notes_played = false
			missing_notes.append(chord_note.pitch)
	
	if all_notes_played:
		emit_signal("note_validated", true)
		return true
	else:
		return false

# Advance to next position in sequence
func advance_sequence():
	if not current_sequence:
		push_error("Attempted to advance null sequence")
		return
		
	unhighlight_current_note()
	played_notes.clear() # Reset played notes for next chord
	
	if current_position < current_sequence.sequence.size() - 1:
		current_position += 1
		var current_notes = current_sequence.sequence[current_position].notes
		var note_names = []
		for note in current_notes:
			note_names.append(note.pitch)
		
		update_display()
		highlight_current_note()
		emit_signal("sequence_updated", current_position)
	else:
		emit_signal("sequence_completed")
		current_position = 0
		update_display()
		highlight_current_note()
		emit_signal("sequence_updated", current_position)

# Update the finger number display
func update_display():
	emit_signal("clear_finger_indicators")
	
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position].notes
		for note in current_notes:
			emit_signal("add_finger_indicator", note, true)

# Highlight current chord notes
func highlight_current_note():
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position].notes
		for note in current_notes:
			emit_signal("highlight_note_by_name", note.pitch, note.hand)

# Remove highlighting from current chord notes
func unhighlight_current_note():
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position].notes
		for note in current_notes:
			emit_signal("unhighlight_note_by_name", note.pitch)

# Utility functions for note name to MIDI conversion
func note_name_to_midi(note_name: String) -> int:
	var note = note_name.left(len(note_name) - 1)
	var octave = int(note_name.right(1))
	if note in MusicalConstants.NOTE_TO_MIDI_OFFSET:
		var note_offset = MusicalConstants.NOTE_TO_MIDI_OFFSET[note]
		return MusicalConstants.STARTING_MIDI_NOTE + (octave * MusicalConstants.KEYS_PER_OCTAVE) + note_offset
	return -1

func midi_to_note_name(midi_note: int) -> String:
	var octave = (midi_note - MusicalConstants.STARTING_MIDI_NOTE) / MusicalConstants.KEYS_PER_OCTAVE
	var note_index = (midi_note - MusicalConstants.STARTING_MIDI_NOTE) % MusicalConstants.KEYS_PER_OCTAVE
	return MusicalConstants.MIDI_TO_NOTE_PREFERRED[note_index] + str(octave)

# Exercise creation methods
func create_scale(music_key: MusicalConstants.MusicKey, hand: Hand) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = PracticeSequence.ExerciseType.SCALES
	
	var exercise = scales.get_exercise(music_key, hand)
	for exercise_position in exercise:
		practice_sequence.add_position(exercise_position)
	
	return practice_sequence

func create_chord_inversions(music_key: MusicalConstants.MusicKey, hand: Hand) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = PracticeSequence.ExerciseType.CHORDS
	
	var exercise = chords.get_exercise(music_key, hand)
	for exercise_position in exercise:
		practice_sequence.add_position(exercise_position)
	
	return practice_sequence

func create_major_arpeggios(music_key: MusicalConstants.MusicKey, hand: Hand) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = PracticeSequence.ExerciseType.MAJOR_ARPEGGIOS
	
	var exercise = major_arpeggios.get_exercise(music_key, hand)
	for exercise_position in exercise:
		practice_sequence.add_position(exercise_position)
	
	return practice_sequence

func create_minor_arpeggios(music_key: MusicalConstants.MusicKey, hand: Hand) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = PracticeSequence.ExerciseType.MINOR_ARPEGGIOS
	
	var exercise = minor_arpeggios.get_exercise(music_key, hand)
	for exercise_position in exercise:
		practice_sequence.add_position(exercise_position)
	
	return practice_sequence
