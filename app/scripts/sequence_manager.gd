class_name SequenceManager
extends Node

signal sequence_updated(current_position: int)
signal sequence_completed
signal note_validated(success: bool)

const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0)
const STUDENT_COLOR = Color(0.8, 0.8, 1.0, 1.0)

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
	if not current_sequence:
		return
		
	unhighlight_current_note()
	
	# Only advance if we haven't reached the end
	if current_position < current_sequence.sequence.size() - 1:
		current_position += 1
		print("Advanced to position: ", current_position)
		var current_notes = current_sequence.sequence[current_position]
		print("Next note: ", current_notes[0].pitch, " Finger: ", current_notes[0].finger)
		
		update_display()
		highlight_current_note()
	else:
		# Reset for new iteration
		print("Sequence completed, resetting")
		emit_signal("sequence_completed")
		current_position = 0
		update_display()
		highlight_current_note()

func validate_input(midi_note: int) -> bool:
	if not current_sequence or current_position >= current_sequence.sequence.size():
		return false
	
	var current_notes = current_sequence.sequence[current_position]
	for expected_note in current_notes:
		var expected_midi = piano_node.note_name_to_midi(expected_note.pitch)
		if expected_midi == midi_note:
			print("Validating note: ", piano_node.midi_to_note_name(midi_note))
			print("Current position: ", current_position)
			return true
	return false


func update_display():
	# Only show current position
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			var key_rect = piano_node.get_key_rect(note.pitch)
			finger_display.add_finger_indicator(note, key_rect, true)

func highlight_current_note():
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			piano_node.highlight_lesson_note(note.pitch)

func unhighlight_current_note():
	if current_position < current_sequence.sequence.size():
		var current_notes = current_sequence.sequence[current_position]
		for note in current_notes:
			var midi_note = piano_node.note_name_to_midi(note.pitch)
			var key = piano_node.white_keys.get(midi_note) if midi_note in piano_node.white_keys else piano_node.black_keys.get(midi_note)
			if key:
				key.color = piano_node.INACTIVE_WHITE_KEY_COLOR if midi_note in piano_node.white_keys else piano_node.INACTIVE_BLACK_KEY_COLOR
