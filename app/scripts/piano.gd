extends Control

# Piano physical layout constants - These define the visual arrangement of piano keys
const WHITE_KEY_OFFSETS = [0, 2, 4, 5, 7, 9, 11]  # Semitone offsets for white keys
const BLACK_KEY_POSITIONS = [
	{"offset": 0.9, "note": 1},   # C#
	{"offset": 2.0, "note": 3},   # D#
	{"offset": 3.8, "note": 6},   # F#
	{"offset": 4.95, "note": 8},  # G#
	{"offset": 6.1, "note": 10}   # A#
]

# Visual size ratios for piano keys
const WHITE_KEY_HEIGHT_RATIO = 0.3
const BLACK_KEY_WIDTH_RATIO = 0.7
const BLACK_KEY_HEIGHT_RATIO = 0.65

# MIDI and musical constants
const KEYS_PER_OCTAVE = 12
const WHITE_KEYS_PER_OCTAVE = 7
const STARTING_MIDI_NOTE = 24  # Starting at C1
const OCTAVE_COUNT = 7

# Color definitions for various key states
const ACTIVE_WHITE_KEY_COLOR = Color(0.8, 0.8, 1.0)
const ACTIVE_BLACK_KEY_COLOR = Color(0.3, 0.3, 0.5)
const INACTIVE_WHITE_KEY_COLOR = Color.WHITE
const INACTIVE_BLACK_KEY_COLOR = Color.BLACK
const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0)    # Green for target notes
const STUDENT_COLOR = Color(0.8, 0.8, 1.0, 1.0)   # Light blue for played notes

# Musical notation constants
const NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

# Chord input handling constants
const CHORD_COLLECTION_WINDOW: float = 0.1  # 100ms window to collect chord notes

# State variables
var white_keys = {}              # Dictionary of white key nodes indexed by MIDI note
var black_keys = {}              # Dictionary of black key nodes indexed by MIDI note
var viewport_size: Vector2       # Current viewport dimensions
var current_chord_notes: Array[int] = []  # Collects notes played within time window
var chord_collection_timer: float = 0.0   # Timer for chord note collection

# Node references
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

func _process(delta: float):
	# Handle chord collection timing
	if chord_collection_timer > 0:
		chord_collection_timer -= delta
		if chord_collection_timer <= 0:
			if sequence_manager and current_chord_notes.size() > 0:
				if sequence_manager.validate_input(current_chord_notes):
					sequence_manager.advance_sequence()
			current_chord_notes.clear()

func setup_fingering_system():
	# Initialize finger display and sequence manager
	finger_display = $PianoKeys/FingerDisplay
	if not finger_display:
		push_error("FingerDisplay node not found in scene (should be at PianoKeys/FingerDisplay)")
		return
	
	sequence_manager = $SequenceManager
	if not sequence_manager:
		push_error("SequenceManager node not found in scene")
		return
	
	sequence_manager.initialize(self, finger_display)
	
	# Load initial exercise
	var c_major = create_c_major_chord_inversions()
	sequence_manager.set_sequence(c_major)

func _input(event):
	if event is InputEventMIDI:
		handle_midi_event(event)

func handle_midi_event(event: InputEventMIDI):
	var note = event.pitch
	var key = white_keys.get(note) if note in white_keys else black_keys.get(note)
	if not key:
		return
		
	if event.message == MIDI_MESSAGE_NOTE_ON and event.velocity > 0:
		key.color = STUDENT_COLOR
		if not current_chord_notes.has(note):
			current_chord_notes.append(note)
		chord_collection_timer = CHORD_COLLECTION_WINDOW
		
		note_display.update_note_state(note, true)
	elif event.message == MIDI_MESSAGE_NOTE_OFF or (event.message == MIDI_MESSAGE_NOTE_ON and event.velocity == 0):
		reset_key_color(key, note)
		note_display.update_note_state(note, false)

func reset_key_color(key: ColorRect, note: int):
	var current_notes = get_current_lesson_notes()
	if current_notes.has(note):
		key.color = LESSON_COLOR
	else:
		key.color = INACTIVE_WHITE_KEY_COLOR if note in white_keys else INACTIVE_BLACK_KEY_COLOR

func create_piano_keys():
	var total_white_keys = WHITE_KEYS_PER_OCTAVE * OCTAVE_COUNT
	var white_key_width = viewport_size.x / total_white_keys
	var white_key_height = viewport_size.y * WHITE_KEY_HEIGHT_RATIO
	var black_key_width = white_key_width * BLACK_KEY_WIDTH_RATIO
	var black_key_height = white_key_height * BLACK_KEY_HEIGHT_RATIO
	
	for octave in range(OCTAVE_COUNT):
		var base_note = octave * KEYS_PER_OCTAVE + STARTING_MIDI_NOTE
		
		# Create white keys for this octave
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
		
		# Create black keys for this octave
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

func highlight_lesson_note(note_name: String):
	var midi_note = note_name_to_midi(note_name)
	var key = white_keys.get(midi_note) if midi_note in white_keys else black_keys.get(midi_note)
	if key:
		key.color = LESSON_COLOR

func get_key_rect(note_name: String) -> Rect2:
	var midi_note = note_name_to_midi(note_name)
	var key = white_keys.get(midi_note) if midi_note in white_keys else black_keys.get(midi_note)
	if key:
		return Rect2(key.global_position, key.size)
	return Rect2()

func get_current_lesson_notes() -> Array[int]:
	var notes: Array[int] = []
	if sequence_manager and sequence_manager.current_sequence:
		var current_chord = sequence_manager.current_sequence.sequence[sequence_manager.current_position]
		for note in current_chord:
			notes.append(note_name_to_midi(note.pitch))
	return notes

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
		var note = PianoNote.new(note_data[0], "R", note_data[1])
		sequence.add_position([note])
	
	return sequence

func create_c_major_chord_inversions() -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "chord_inversions"
	
	# Root position: C4(1) - E4(3) - G4(5)
	sequence.add_position([
		PianoNote.new("C4", "R", 1),  # Root - thumb
		PianoNote.new("E4", "R", 3),  # Third - middle finger
		PianoNote.new("G4", "R", 5)   # Fifth - pinky
	])
	
	# First inversion: E4(1) - G4(2) - C5(5)
	sequence.add_position([
		PianoNote.new("E4", "R", 1),  # Third - thumb
		PianoNote.new("G4", "R", 2),  # Fifth - index finger
		PianoNote.new("C5", "R", 5)   # Root - pinky
	])
	
	# Second inversion: G4(1) - C5(3) - E5(5)
	sequence.add_position([
		PianoNote.new("G4", "R", 1),  # Fifth - thumb
		PianoNote.new("C5", "R", 3),  # Root - middle finger
		PianoNote.new("E5", "R", 5)   # Third - pinky
	])
	
	# Root position octave up: C5(1) - E5(3) - G5(5)
	sequence.add_position([
		PianoNote.new("C5", "R", 1),  # Root - thumb
		PianoNote.new("E5", "R", 3),  # Third - middle finger
		PianoNote.new("G5", "R", 5)   # Fifth - pinky
	])
	
	return sequence
