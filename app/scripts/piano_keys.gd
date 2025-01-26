extends Node2D

const Hand = preload("res://scripts/constants/hand.gd").Hand

# Piano physical layout constants - These define the visual arrangement of piano keys
const WHITE_KEY_OFFSETS = [0, 2, 4, 5, 7, 9, 11] # Semitone offsets for white keys
const BLACK_KEY_POSITIONS = [
	{"offset": 0.9, "note": 1}, # C#
	{"offset": 2.0, "note": 3}, # D#
	{"offset": 3.8, "note": 6}, # F#
	{"offset": 4.95, "note": 8}, # G#
	{"offset": 6.1, "note": 10} # A#
]

# Visual size ratios for piano keys
const WHITE_KEY_HEIGHT_RATIO = 0.3
const BLACK_KEY_WIDTH_RATIO = 0.7
const BLACK_KEY_HEIGHT_RATIO = 0.65

# MIDI and musical constants
const WHITE_KEYS_PER_OCTAVE = 7
const OCTAVE_COUNT = 7

# Color definitions for various key states
const INACTIVE_WHITE_KEY_COLOR = Color.WHITE
const INACTIVE_BLACK_KEY_COLOR = Color.BLACK

# Finger display constants
const BACKGROUND_HEIGHT = 40
const KEY_ADJUSTMENTS = {
	"C": - 2, # Slight left adjustment
	"D": - 3,
	"E": - 2,
	"F": - 2,
	"G": - 3,
	"A": - 3,
	"B": - 2,
	"C#": - 4, # Black keys
	"D#": - 4,
	"F#": - 4,
	"G#": - 4,
	"A#": - 4
}

# State variables
var white_keys = {} # Dictionary of white key nodes indexed by MIDI note
var black_keys = {} # Dictionary of black key nodes indexed by MIDI note
var background_rect: ColorRect
var finger_labels: Array[Label] = []

func create_piano_keys(viewport_size: Vector2):
	var total_white_keys = WHITE_KEYS_PER_OCTAVE * OCTAVE_COUNT
	var white_key_width = viewport_size.x / total_white_keys
	var white_key_height = viewport_size.y * WHITE_KEY_HEIGHT_RATIO
	var black_key_width = white_key_width * BLACK_KEY_WIDTH_RATIO
	var black_key_height = white_key_height * BLACK_KEY_HEIGHT_RATIO
	
	for octave in range(OCTAVE_COUNT):
		var base_note = octave * MusicalConstants.KEYS_PER_OCTAVE + MusicalConstants.STARTING_MIDI_NOTE
		
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

func highlight_lesson_note_by_name(note_name: String, hand: Hand):
	var midi_note = note_name_to_midi(note_name)
	var key = get_key_by_midi(midi_note)
	if key:
		key.color = Colors.RIGHT_HAND_COLOR if hand == Hand.RIGHT_HAND else Colors.LEFT_HAND_COLOR

func get_key_rect_by_name(note_name: String) -> Rect2:
	var midi_note = note_name_to_midi(note_name)
	var key = get_key_by_midi(midi_note)
	if key:
		return Rect2(key.global_position, key.size)
	return Rect2()

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

func _ready():
	setup_background()
	call_deferred("_connect_signals")

func _connect_signals():
	var exercise_manager = get_parent().get_node("ExerciseManager")
	if exercise_manager:
		exercise_manager.connect("highlight_note_by_name", _on_highlight_note_by_name)
		exercise_manager.connect("unhighlight_note_by_name", _on_unhighlight_note_by_name)
		exercise_manager.connect("clear_finger_indicators", _on_clear_finger_indicators)
		exercise_manager.connect("add_finger_indicator", _on_add_finger_indicator)
		exercise_manager.connect("clear_highlighted_keys", _on_clear_highlighted_keys)

func setup_background():
	background_rect = ColorRect.new()
	background_rect.color = Colors.BACKGROUND_COLOR
	background_rect.z_index = -1
	add_child(background_rect)
	update_background_size()

func _process(delta):
	update_background_size()

func update_background_size():
	if background_rect:
		var viewport_size = get_viewport_rect().size
		background_rect.size = Vector2(viewport_size.x, BACKGROUND_HEIGHT)
		background_rect.position = Vector2(0, -BACKGROUND_HEIGHT)

func clear_indicators():
	print("Clearingfingerindicators")
	for label in finger_labels:
		label.queue_free()
	finger_labels.clear()

func add_finger_indicator(note: PianoNote, is_current: bool = false):
	print("Addingfingerindicator for note: ", note.pitch)
	var key_rect = get_key_rect_by_name(note.pitch)
	
	var label = Label.new()
	label.text = str(note.finger)
	label.add_theme_font_size_override("font_size", 24)
	
	var color = Colors.RIGHT_HAND_COLOR if note.hand == Hand.RIGHT_HAND else Colors.LEFT_HAND_COLOR
	label.add_theme_color_override("font_color", color)
	
	add_child(label)
	finger_labels.append(label)
	label.size = label.get_minimum_size()
	
	var note_name = note.pitch.left(len(note.pitch) - 1)
	var x_adjustment = KEY_ADJUSTMENTS.get(note_name, 0)
	
	label.position = Vector2(
		key_rect.position.x + (key_rect.size.x / 2) - (label.size.x / 2) + x_adjustment,
		-BACKGROUND_HEIGHT/2 - label.size.y/2
	)

func _on_highlight_note_by_name(note_name: String, hand: Hand):
	print("Highlightingnote: ", note_name)
	highlight_lesson_note_by_name(note_name, hand)

func _on_unhighlight_note_by_name(note_name: String):
	print("Unhighlightingnote: ", note_name)
	var midi_note = note_name_to_midi(note_name)
	var key = get_key_by_midi(midi_note)
	if key:
		key.color = get_inactive_key_color(midi_note)

func _on_clear_highlighted_keys():
	print("Clearinghighlightedkeys")
	for key in white_keys.values():
		key.color = INACTIVE_WHITE_KEY_COLOR
	for key in black_keys.values():
		key.color = INACTIVE_BLACK_KEY_COLOR

func _on_clear_finger_indicators():
	clear_indicators()

func _on_add_finger_indicator(note: PianoNote, is_current: bool):
	add_finger_indicator(note, is_current)
