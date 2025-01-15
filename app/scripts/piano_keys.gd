extends Node2D

# Piano physical layout constants - These define the visual arrangement of piano keys
const WHITE_KEY_OFFSETS = [0, 2, 4, 5, 7, 9, 11] # Semitone offsets for white keys
const BLACK_KEY_POSITIONS = [
	{"offset": 0.9, "note": 1}, # C#
	{"offset": 2.0, "note": 3}, # D#
	{"offset": 3.8, "note": 6}, # F#
	{"offset": 4.95, "note": 8}, # G#
	{"offset": 6.1, "note": 10} # A#
]

# Musical notation constants
const NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]


# Visual size ratios for piano keys
const WHITE_KEY_HEIGHT_RATIO = 0.3
const BLACK_KEY_WIDTH_RATIO = 0.7
const BLACK_KEY_HEIGHT_RATIO = 0.65

# MIDI and musical constants
const KEYS_PER_OCTAVE = 12
const WHITE_KEYS_PER_OCTAVE = 7
const STARTING_MIDI_NOTE = 24 # Starting at C1
const OCTAVE_COUNT = 7

# Color definitions for various key states
const INACTIVE_WHITE_KEY_COLOR = Color.WHITE
const INACTIVE_BLACK_KEY_COLOR = Color.BLACK
const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0) # Green for target notes

# State variables
var white_keys = {} # Dictionary of white key nodes indexed by MIDI note
var black_keys = {} # Dictionary of black key nodes indexed by MIDI note

func create_piano_keys(viewport_size: Vector2):
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
			
			add_child(white_key)
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
			add_child(black_key)
			black_keys[base_note + data.note] = black_key

func get_key_by_midi(note: int) -> ColorRect:
	return white_keys.get(note) if note in white_keys else black_keys.get(note)

func get_inactive_key_color(note: int) -> Color:
	return INACTIVE_WHITE_KEY_COLOR if note in white_keys else INACTIVE_BLACK_KEY_COLOR

func highlight_lesson_note_by_name(note_name: String):
	var midi_note = note_name_to_midi(note_name)
	var key = get_key_by_midi(midi_note)
	if key:
		key.color = LESSON_COLOR

func get_key_rect_by_name(note_name: String) -> Rect2:
	var midi_note = note_name_to_midi(note_name)
	var key = get_key_by_midi(midi_note)
	if key:
		return Rect2(key.global_position, key.size)
	return Rect2()

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

func _ready():
	var sequence_manager = get_parent().get_node("SequenceManager")
	sequence_manager.connect("highlight_note_by_name", _on_highlight_note_by_name)
	sequence_manager.connect("unhighlight_note_by_name", _on_unhighlight_note_by_name)
	
	var exercise_manager = get_parent().get_node("ExerciseManager")
	exercise_manager.connect("clear_highlighted_keys", _on_clear_highlighted_keys)

func _on_highlight_note_by_name(note_name: String):
	highlight_lesson_note_by_name(note_name)

func _on_unhighlight_note_by_name(note_name: String):
	var midi_note = note_name_to_midi(note_name)
	var key = get_key_by_midi(midi_note)
	if key:
		key.color = get_inactive_key_color(midi_note)

func _on_clear_highlighted_keys():
	for key in white_keys.values():
		key.color = INACTIVE_WHITE_KEY_COLOR
	for key in black_keys.values():
		key.color = INACTIVE_BLACK_KEY_COLOR
