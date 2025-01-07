extends Control

# Piano physical layout constants
const WHITE_KEY_OFFSETS = [0, 2, 4, 5, 7, 9, 11]
const BLACK_KEY_POSITIONS = [
	{"offset": 0.9, "note": 1},
	{"offset": 2.0, "note": 3},
	{"offset": 3.8, "note": 6},
	{"offset": 4.95, "note": 8},
	{"offset": 6.1, "note": 10}
]

const WHITE_KEY_HEIGHT_RATIO = 0.3
const BLACK_KEY_WIDTH_RATIO = 0.7
const BLACK_KEY_HEIGHT_RATIO = 0.65

const KEYS_PER_OCTAVE = 12
const WHITE_KEYS_PER_OCTAVE = 7
const STARTING_MIDI_NOTE = 24
const OCTAVE_COUNT = 7

const ACTIVE_WHITE_KEY_COLOR = Color(0.8, 0.8, 1.0)
const ACTIVE_BLACK_KEY_COLOR = Color(0.3, 0.3, 0.5)
const INACTIVE_WHITE_KEY_COLOR = Color.WHITE
const INACTIVE_BLACK_KEY_COLOR = Color.BLACK
const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0)  # Green for target note
const STUDENT_COLOR = Color(0.8, 0.8, 1.0, 1.0)  # Light blue for played note

# Note name conversion constants
const NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

var white_keys = {}
var black_keys = {}
var active_notes = {}
var viewport_size: Vector2

# New instance variables for fingering system
var sequence_manager: SequenceManager
var finger_display: FingerDisplay

@onready var note_display = $NoteDisplay
@onready var piano_keys = $PianoKeys

func _ready():
	viewport_size = get_viewport_rect().size
	piano_keys.position = Vector2(0, viewport_size.y - viewport_size.y * WHITE_KEY_HEIGHT_RATIO)
	create_piano_keys()
	setup_fingering_system()
	OS.open_midi_inputs()

func setup_fingering_system():
	# Get FingerDisplay node using correct path
	finger_display = $PianoKeys/FingerDisplay
	if not finger_display:
		push_error("FingerDisplay node not found in scene (should be at PianoKeys/FingerDisplay)")
		return
	
	# Get SequenceManager node
	sequence_manager = $SequenceManager
	if not sequence_manager:
		push_error("SequenceManager node not found in scene")
		return
	
	# Initialize SequenceManager with references
	sequence_manager.initialize(self, finger_display)
	
	# Connect signals
	sequence_manager.note_validated.connect(_on_note_validated)
	sequence_manager.sequence_completed.connect(_on_sequence_completed)
	
	# Load initial exercise (for testing)
	var c_major = create_c_major_scale()
	sequence_manager.set_sequence(c_major)
	
func _input(event):
	if event is InputEventMIDI:
		handle_midi_event(event)

func create_piano_keys():
	var total_white_keys = WHITE_KEYS_PER_OCTAVE * OCTAVE_COUNT
	var white_key_width = viewport_size.x / total_white_keys
	var white_key_height = viewport_size.y * WHITE_KEY_HEIGHT_RATIO
	var black_key_width = white_key_width * BLACK_KEY_WIDTH_RATIO
	var black_key_height = white_key_height * BLACK_KEY_HEIGHT_RATIO
	
	for octave in range(OCTAVE_COUNT):
		var base_note = octave * KEYS_PER_OCTAVE + STARTING_MIDI_NOTE
		
		# White keys
		for i in range(WHITE_KEYS_PER_OCTAVE):
			var white_key = ColorRect.new()
			white_key.size = Vector2(white_key_width, white_key_height)
			white_key.position.x = (octave * WHITE_KEYS_PER_OCTAVE + i) * white_key_width
			white_key.color = INACTIVE_WHITE_KEY_COLOR
			
			var border = Line2D.new()
			border.points = [
				Vector2(0, 0),
				Vector2(0, white_key_height),
				Vector2(white_key_width, white_key_height),
				Vector2(white_key_width, 0),
				Vector2(0, 0)
			]
			border.width = 1
			border.default_color = INACTIVE_BLACK_KEY_COLOR
			white_key.add_child(border)
			
			piano_keys.add_child(white_key)
			white_keys[base_note + WHITE_KEY_OFFSETS[i]] = white_key
		
		# Black keys
		for data in BLACK_KEY_POSITIONS:
			var black_key = ColorRect.new()
			black_key.size = Vector2(black_key_width, black_key_height)
			black_key.position = Vector2(
				(octave * WHITE_KEYS_PER_OCTAVE + data.offset) * white_key_width - black_key_width / 2,
				0
			)
			black_key.color = INACTIVE_BLACK_KEY_COLOR
			piano_keys.add_child(black_key)
			black_keys[base_note + data.note] = black_key

func handle_midi_event(event: InputEventMIDI):
	if event.message == MIDI_MESSAGE_NOTE_ON:
		highlight_key(event.pitch, event.velocity > 0)
	elif event.message == MIDI_MESSAGE_NOTE_OFF:
		highlight_key(event.pitch, false)

func highlight_key(note, is_active):
	var key = white_keys.get(note) if note in white_keys else black_keys.get(note)
	if key:
		if is_active:
			key.color = STUDENT_COLOR
			# Check if this matches the current lesson note
			if sequence_manager and sequence_manager.validate_input(
				midi_to_note_name(note),
				"R",  # Assuming right hand for now
				1     # We'll need to implement finger detection
			):
				sequence_manager.advance_sequence()
		else:
			# Reset to lesson color if it's the current target note, otherwise inactive
			var current_note = get_current_lesson_note()
			if current_note and note_name_to_midi(current_note) == note:
				key.color = LESSON_COLOR
			else:
				key.color = INACTIVE_WHITE_KEY_COLOR if note in white_keys else INACTIVE_BLACK_KEY_COLOR
		note_display.update_note_state(note, is_active)

func highlight_lesson_note(note_name: String):
	var midi_note = note_name_to_midi(note_name)
	var key = white_keys.get(midi_note) if midi_note in white_keys else black_keys.get(midi_note)
	if key:
		key.color = LESSON_COLOR

# New methods for fingering system
func get_key_rect(note_name: String) -> Rect2:
	var midi_note = note_name_to_midi(note_name)
	var key = white_keys.get(midi_note) if midi_note in white_keys else black_keys.get(midi_note)
	if key:
		return Rect2(key.global_position, key.size)
	return Rect2()

func get_current_lesson_note() -> String:
	if sequence_manager and sequence_manager.current_sequence:
		var current_notes = sequence_manager.current_sequence.sequence[sequence_manager.current_position]
		if current_notes and current_notes.size() > 0:
			return current_notes[0].pitch
	return ""

func note_name_to_midi(note_name: String) -> int:
	var note = note_name.left(len(note_name) - 1)
	var octave = int(note_name.right(1))
	var note_index = NOTE_NAMES.find(note)
	if note_index != -1:
		return STARTING_MIDI_NOTE + (octave * KEYS_PER_OCTAVE) + note_index
	return -1

func midi_to_note_name(midi_note: int) -> String:
	var octave = (midi_note - STARTING_MIDI_NOTE) / KEYS_PER_OCTAVE
	var note_index = (midi_note - STARTING_MIDI_NOTE) % KEYS_PER_OCTAVE
	return NOTE_NAMES[note_index] + str(octave)

func _on_note_validated(success: bool):
	if success:
		sequence_manager.advance_sequence()

func _on_sequence_completed():
	print("Sequence completed successfully!")

# Exercise creation methods
func create_c_major_scale() -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "scale"
	
	# Right hand ascending C Major scale with correct fingering
	var scale_notes = [
		["C4", 1],  # Thumb
		["D4", 2],  # Index
		["E4", 3],  # Middle
		["F4", 1],  # Thumb (thumb under)
		["G4", 2],  # Index
		["A4", 3],  # Middle
		["B4", 4],  # Ring
		["C5", 5]   # Pinky
	]
	
	for note_data in scale_notes:
		sequence.add_position([PianoNote.new(note_data[0], "R", note_data[1])])
	
	return sequence

func create_c_major_chord() -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "chord"
	
	# Create a single position with multiple notes for the chord
	sequence.add_position([
		PianoNote.new("C4", "R", 1),
		PianoNote.new("E4", "R", 3),
		PianoNote.new("G4", "R", 5)
	])
	
	return sequence

func set_exercise(exercise_type: String):
	match exercise_type:
		"c_major_scale":
			sequence_manager.set_sequence(create_c_major_scale())
		"c_major_chord":
			sequence_manager.set_sequence(create_c_major_chord())
		_:
			push_error("Unknown exercise type: " + exercise_type)
