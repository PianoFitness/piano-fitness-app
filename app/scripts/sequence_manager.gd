class_name SequenceManager
extends Node

signal sequence_updated(current_position: int)
signal sequence_completed
signal note_validated(success: bool)

const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0)  # Green for target note
const STUDENT_COLOR = Color(0.8, 0.8, 1.0, 1.0)  # Light blue for played note

var current_sequence: PracticeSequence
var current_position: int = 0
var finger_display: FingerDisplay
var piano_node: Node

func initialize(piano: Node, display: FingerDisplay):
	piano_node = piano
	finger_display = display
	
func set_sequence(sequence: PracticeSequence):
	current_sequence = sequence
	current_position = 0
	update_display()
	highlight_current_note()

func advance_sequence():
	if current_position < current_sequence.sequence.size() - 1:
		current_position += 1
		emit_signal("sequence_updated", current_position)
		update_display()
		highlight_current_note()
	else:
		emit_signal("sequence_completed")
		# Optional: Reset for repetition
		current_position = 0
		update_display()
		highlight_current_note()

func validate_input(note: String, hand: String, finger: int) -> bool:
	if current_position >= current_sequence.sequence.size():
		return false
		
	var current_notes = current_sequence.sequence[current_position]
	for expected_note in current_notes:
		if expected_note.pitch == note and expected_note.hand == hand:
			var success = expected_note.finger == finger
			emit_signal("note_validated", success)
			return success
	return false

func update_display():
	finger_display.clear_indicators()
	
	# Show current position
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			var key_rect = piano_node.get_key_rect(note.pitch)
			finger_display.add_finger_indicator(note, key_rect, true)  # Current note
	
	# Show upcoming position with regular color
	if current_position + 1 < current_sequence.sequence.size():
		var upcoming_notes = current_sequence.sequence[current_position + 1]
		for note in upcoming_notes:
			var key_rect = piano_node.get_key_rect(note.pitch)
			finger_display.add_finger_indicator(note, key_rect, false)

func highlight_current_note():
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			# Call piano's method to highlight the current note
			piano_node.highlight_lesson_note(note.pitch)
