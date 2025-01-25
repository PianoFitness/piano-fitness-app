extends Control

# Signals
signal clear_highlighted_keys
signal exercise_sequence_created(sequence: PracticeSequence)

# Node references
@onready var hand_dropdown = $HBoxContainer/HandDropdown
@onready var exercise_type_dropdown = $HBoxContainer/ExerciseTypeDropdown
@onready var music_key_dropdown = $HBoxContainer/KeyDropdown

# Load exercises
@onready var scales = preload("res://scripts/exercises/scales_major.gd").new()
@onready var chords = preload("res://scripts/exercises/chords_major.gd").new()
@onready var arpeggios = preload("res://scripts/exercises/arpeggios_major.gd").new()

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
	exercise_type_dropdown.add_item("Arpeggios")
	
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
	print("Updating exercise")
	emit_signal("clear_highlighted_keys")
	
	var exercise_type = exercise_type_dropdown.get_item_text(exercise_type_dropdown.selected)
	var music_key_str = music_key_dropdown.get_item_text(music_key_dropdown.selected)
	var music_key = null
	for key in MusicalConstants.MusicKey.values():
		if MusicalConstants.MUSIC_KEY_STRINGS[key] == music_key_str:
			music_key = key
			break
	
	var hand = MusicalConstants.Hand.RIGHT if hand_dropdown.get_item_text(hand_dropdown.selected).begins_with("Right") else MusicalConstants.Hand.LEFT
	var hand_name = "right_hand" if hand == MusicalConstants.Hand.RIGHT else "left_hand"

	var exercises = {
		"Scales": "create_scale",
		"Chords": "create_chord_inversions",
		"Arpeggios": "create_arpeggios"
	}
	
	if exercises.has(exercise_type):
		var exercise_method = exercises[exercise_type]
		var exercise_sequence = self.call(exercise_method, music_key, hand_name, hand)
		emit_signal("exercise_sequence_created", exercise_sequence)

# Exercise creation methods
func create_scale(music_key: MusicalConstants.MusicKey, hand_name: String, hand: MusicalConstants.Hand) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = "scale"
	
	var scale_notes = scales.get_exercise(music_key, hand_name)
	for note_data in scale_notes:
		var note = PianoNote.new(note_data[0], hand, note_data[1])
		practice_sequence.add_position([note])
	
	return practice_sequence

func create_chord_inversions(music_key: MusicalConstants.MusicKey, hand_name: String, hand: MusicalConstants.Hand) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = "chord_inversions"
	
	var chord_notes = chords.get_exercise(music_key, hand_name)
	for chord in chord_notes:
		var chord_position: Array[PianoNote] = []
		for note_data in chord:
			var note = PianoNote.new(note_data[0], hand, note_data[1])
			chord_position.append(note)
		practice_sequence.add_position(chord_position)
	
	return practice_sequence

func create_arpeggios(music_key: MusicalConstants.MusicKey, hand_name: String, hand: MusicalConstants.Hand) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = "arpeggio"
	
	var arpeggio_notes = arpeggios.get_exercise(music_key, hand_name)
	for note_data in arpeggio_notes:
		var note = PianoNote.new(note_data[0], hand, note_data[1])
		practice_sequence.add_position([note])
	
	return practice_sequence
