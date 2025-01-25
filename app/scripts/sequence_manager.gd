class_name SequenceManager
extends Node

# Signals for communication with other nodes
signal sequence_updated(current_position: int)
signal sequence_completed
signal note_validated(success: bool)
signal highlight_note_by_name(note_name: String, hand: MusicalConstants.Hand)
signal unhighlight_note_by_name(note_name: String)
signal clear_finger_indicators
signal add_finger_indicator(note: PianoNote, is_current: bool)

# Constants for visual feedback
const STUDENT_COLOR = Color(0.8, 0.8, 1.0, 1.0) # Light blue for played notes

# State tracking variables
var current_sequence: PracticeSequence # The current exercise sequence
var current_position: int = 0 # Current position in the sequence
var played_notes: Dictionary = {} # Tracks which notes have been played in current chord

func _ready():
	var exercise_manager = get_parent().get_node("ExerciseManager")
	exercise_manager.connect("exercise_sequence_created", _on_exercise_sequence_created)

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

# Handle the exercise_sequence_created signal
func _on_exercise_sequence_created(sequence: PracticeSequence):
	set_sequence(sequence)

# Validate an array of MIDI notes against current chord
func validate_input(midi_notes: Array[int]) -> bool:
	if not current_sequence or current_position >= current_sequence.sequence.size():
		return false
	
	var current_notes = current_sequence.sequence[current_position]
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
		var current_notes = current_sequence.sequence[current_position]
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
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			emit_signal("add_finger_indicator", note, true)

# Highlight current chord notes
func highlight_current_note():
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			emit_signal("highlight_note_by_name", note.pitch, note.hand)

# Remove highlighting from current chord notes
func unhighlight_current_note():
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			emit_signal("unhighlight_note_by_name", note.pitch)

# Get the current sequence position
func get_current_position() -> int:
	return current_position

# Check if a sequence is currently active
func has_active_sequence() -> bool:
	return current_sequence != null

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
