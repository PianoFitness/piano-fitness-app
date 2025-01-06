# Piano.gd
extends Node2D

const WHITE_KEY_OFFSETS = [0, 2, 4, 5, 7, 9, 11]

var white_keys = {}
var black_keys = {}
var active_notes = {}
var viewport_size: Vector2

func _ready():
	viewport_size = get_viewport_rect().size
	position = Vector2(0, viewport_size.y - viewport_size.y * 0.3)
	create_piano_keys()
	OS.open_midi_inputs()
	
func _input(event):
	if event is InputEventMIDI:
		handle_midi_event(event)

func create_piano_keys():
	var total_white_keys = 7 * 7
	var white_key_width = viewport_size.x / total_white_keys
	var white_key_height = viewport_size.y * 0.3
	var black_key_width = white_key_width * 0.7
	var black_key_height = white_key_height * 0.65
	
	for octave in range(7):
		var base_note = octave * 12 + 24
		
		# White keys
		for i in range(7):
			var white_key = ColorRect.new()
			white_key.size = Vector2(white_key_width, white_key_height)
			white_key.position.x = (octave * 7 + i) * white_key_width
			white_key.color = Color.WHITE
			
			var border = Line2D.new()
			border.points = [
				Vector2(0, 0),
				Vector2(0, white_key_height),
				Vector2(white_key_width, white_key_height),
				Vector2(white_key_width, 0),
				Vector2(0, 0)
			]
			border.width = 1
			border.default_color = Color.BLACK
			white_key.add_child(border)
			
			add_child(white_key)
			white_keys[base_note + WHITE_KEY_OFFSETS[i]] = white_key
		
		# Black keys - positioned relative to white keys
		var black_key_data = [
			{"offset": 0.9, "note": 1},  # C#/Db
			{"offset": 2, "note": 3},  # D#/Eb
			{"offset": 3.8, "note": 6},  # F#/Gb
			{"offset": 4.95, "note": 8},  # G#/Ab
			{"offset": 6.1, "note": 10}  # A#/Bb
		]
		
		for data in black_key_data:
			var black_key = ColorRect.new()
			black_key.size = Vector2(black_key_width, black_key_height)
			black_key.position = Vector2(
				(octave * 7 + data.offset) * white_key_width - black_key_width/2,
				0
			)
			black_key.color = Color.BLACK
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
		key.color = (Color(0.8, 0.8, 1.0) if note in white_keys else Color(0.3, 0.3, 0.5)) if is_active else (Color.WHITE if note in white_keys else Color.BLACK)
