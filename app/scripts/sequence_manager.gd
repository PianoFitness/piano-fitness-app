class_name SequenceManager
extends Node

# Signals for communication with other nodes
signal sequence_updated(current_position: int)
signal sequence_completed
signal note_validated(success: bool)
signal highlight_note_by_name(note_name: String, hand: MusicalConstants.Hand)
signal unhighlight_note_by_name(note_name: String)

# Constants for visual feedback
const STUDENT_COLOR = Color(0.8, 0.8, 1.0, 1.0) # Light blue for played notes

# State tracking variables
var current_sequence: PracticeSequence # The current exercise sequence
var current_position: int = 0 # Current position in the sequence
var played_notes: Dictionary = {} # Tracks which notes have been played in current chord
var finger_display: FingerDisplay # Reference to finger number display
var piano_node: Node # Reference to main piano node

# Initialize manager with required node references
func initialize(piano_keys: Node, display: FingerDisplay):
	piano_node = piano_keys
	finger_display = display

# Set a new sequence and reset state
func set_sequence(sequence: PracticeSequence):
	if not sequence:
		push_error("Attempted to set null sequence")
		return
		
	current_sequence = sequence
	current_position = 0
	played_notes.clear() # Reset played notes tracking
	
	print("Setting new sequence: ", sequence.exercise_type)
	update_display()
	highlight_current_note()

# Validate an array of MIDI notes against current chord
func validate_input(midi_notes: Array[int]) -> bool:
	if not current_sequence or current_position >= current_sequence.sequence.size():
		print("Invalid sequence state")
		return false
	
	var current_notes = current_sequence.sequence[current_position]
	print("\nValidating chord input: ", midi_notes)
	
	# First validate that all played notes are part of the expected chord
	for midi_note in midi_notes:
		var note_valid = false
		for expected_note in current_notes:
			var expected_midi = piano_node.note_name_to_midi(expected_note.pitch)
			if expected_midi == midi_note and not played_notes.has(expected_midi):
				note_valid = true
				played_notes[expected_midi] = true
				print("Valid note played: ", piano_node.midi_to_note_name(midi_note))
				break
		
		if not note_valid:
			print("Invalid note in chord: ", piano_node.midi_to_note_name(midi_note))
			return false
	
	# Then check if all required notes for the chord have been played
	var all_notes_played = true
	var missing_notes = []
	for chord_note in current_notes:
		var chord_midi = piano_node.note_name_to_midi(chord_note.pitch)
		if not played_notes.has(chord_midi):
			all_notes_played = false
			missing_notes.append(chord_note.pitch)
	
	if all_notes_played:
		print("Complete chord played correctly!")
		emit_signal("note_validated", true)
		return true
	else:
		print("Valid notes, but chord incomplete. Missing: ", missing_notes)
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
		print("\nAdvanced to position: ", current_position)
		var current_notes = current_sequence.sequence[current_position]
		var note_names = []
		for note in current_notes:
			note_names.append(note.pitch)
		print("Current notes: ", note_names)
		
		update_display()
		highlight_current_note()
		emit_signal("sequence_updated", current_position)
	else:
		print("\nSequence completed, resetting")
		emit_signal("sequence_completed")
		current_position = 0
		update_display()
		highlight_current_note()
		emit_signal("sequence_updated", current_position)

# Update the finger number display
func update_display():
	if not finger_display:
		push_error("FingerDisplay reference not set")
		return
		
	# Clear existing finger indicators (you'll need to implement this in FingerDisplay)
	if finger_display.has_method("clear_indicators"):
		finger_display.clear_indicators()
	
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			var key_rect = piano_node.get_key_rect_by_name(note.pitch)
			finger_display.add_finger_indicator(note, key_rect, true)

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
