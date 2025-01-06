extends Node2D

# Piano physical layout constants
const WHITE_KEY_OFFSETS = [0, 2, 4, 5, 7, 9, 11] # Semitone offsets for white keys
const BLACK_KEY_POSITIONS = [
	{"offset": 0.9, "note": 1}, # C#/Db
	{"offset": 2.0, "note": 3}, # D#/Eb
	{"offset": 3.8, "note": 6}, # F#/Gb
	{"offset": 4.95, "note": 8}, # G#/Ab
	{"offset": 6.1, "note": 10} # A#/Bb
]

# Piano dimensional ratios
const WHITE_KEY_HEIGHT_RATIO = 0.3 # Height of white keys relative to viewport
const BLACK_KEY_WIDTH_RATIO = 0.7 # Width of black keys relative to white keys
const BLACK_KEY_HEIGHT_RATIO = 0.65 # Height of black keys relative to white keys

# Piano musical constants
const KEYS_PER_OCTAVE = 12 # Semitones per octave
const WHITE_KEYS_PER_OCTAVE = 7 # White keys per octave
const STARTING_MIDI_NOTE = 24 # Starting MIDI note (C1)
const OCTAVE_COUNT = 7 # Number of octaves to display

# Visual feedback colors
const ACTIVE_WHITE_KEY_COLOR = Color(0.8, 0.8, 1.0)
const ACTIVE_BLACK_KEY_COLOR = Color(0.3, 0.3, 0.5)
const INACTIVE_WHITE_KEY_COLOR = Color.WHITE
const INACTIVE_BLACK_KEY_COLOR = Color.BLACK

# Instance variables
var white_keys = {}
var black_keys = {}
var active_notes = {}
var viewport_size: Vector2

@onready var note_display = $NoteDisplay

func _ready():
	viewport_size = get_viewport_rect().size
	position = Vector2(0, viewport_size.y - viewport_size.y * WHITE_KEY_HEIGHT_RATIO)
	create_piano_keys()
	OS.open_midi_inputs()
	
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
			
			add_child(white_key)
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
			add_child(black_key)
			black_keys[base_note + data.note] = black_key

func handle_midi_event(event: InputEventMIDI):
	if event.message == MIDI_MESSAGE_NOTE_ON:
		highlight_key(event.pitch, event.velocity > 0)
	elif event.message == MIDI_MESSAGE_NOTE_OFF:
		highlight_key(event.pitch, false)

func highlight_key(note, is_active):
	var key = white_keys.get(note) if note in white_keys else black_keys.get(note)
	if key:
		key.color = (ACTIVE_WHITE_KEY_COLOR if note in white_keys else ACTIVE_BLACK_KEY_COLOR) if is_active else (INACTIVE_WHITE_KEY_COLOR if note in white_keys else INACTIVE_BLACK_KEY_COLOR)
		
		# Delegate note display update to NoteDisplay node
		note_display.update_note_state(note, is_active)
