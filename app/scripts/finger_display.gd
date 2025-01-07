class_name FingerDisplay
extends Node2D

const LEFT_HAND_COLOR = Color(0.8, 0.8, 0.8, 1.0)
const RIGHT_HAND_COLOR = Color(0.8, 0.8, 0.8, 1.0)
const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0)
const BACKGROUND_COLOR = Color(0.1, 0.1, 0.1, 1.0)
const BACKGROUND_HEIGHT = 40

# Adjustment dictionary for x-position offsets (in pixels)
const KEY_ADJUSTMENTS = {
	"C": -2,   # Slight left adjustment for C
	"D": -3,   # More left adjustment for D
	"E": -2,   # Slight left adjustment for E
	"F": -2,   # Slight left adjustment for F
	"G": -3,   # More left adjustment for G
	"A": -3,   # More left adjustment for A
	"B": -2,   # Slight left adjustment for B
	"C#": -4,  # Black keys need larger adjustments
	"D#": -4,
	"F#": -4,
	"G#": -4,
	"A#": -4
}

var current_indicators: Array = []
var background_rect: ColorRect
var font: Font

func _ready():
	font = ThemeDB.fallback_font
	setup_background()

func setup_background():
	background_rect = ColorRect.new()
	background_rect.color = BACKGROUND_COLOR
	background_rect.z_index = -1  # Ensure background is drawn behind indicators
	add_child(background_rect)
	
	# Initialize the background size
	update_background_size()

func _process(_delta):
	update_background_size()

func update_background_size():
	if background_rect:
		var viewport_size = get_viewport_rect().size
		background_rect.size = Vector2(viewport_size.x, BACKGROUND_HEIGHT)
		background_rect.position = Vector2(0, -BACKGROUND_HEIGHT)

func clear_indicators():
	for indicator in current_indicators:
		if is_instance_valid(indicator):
			indicator.queue_free()
	current_indicators.clear()

func add_finger_indicator(note: PianoNote, key_rect: Rect2, is_current: bool = false):
	var label = Label.new()
	label.text = str(note.finger)
	label.add_theme_font_override("font", font)
	label.add_theme_font_size_override("font_size", 24)
	
	# Set color based on current state
	var color = LESSON_COLOR if is_current else (RIGHT_HAND_COLOR if note.hand == "R" else LEFT_HAND_COLOR)
	label.add_theme_color_override("font_color", color)
	
	# Force the label to calculate its true size
	add_child(label)
	label.size = label.get_minimum_size()
	
	# Get note name without octave for adjustment lookup
	var note_name = note.pitch.left(len(note.pitch) - 1)
	var x_adjustment = KEY_ADJUSTMENTS.get(note_name, 0)
	
	# Calculate centered position with precise offset and adjustment
	var x_pos = key_rect.position.x + (key_rect.size.x / 2) - (label.size.x / 2) + x_adjustment
	var y_pos = -BACKGROUND_HEIGHT/2 - label.size.y/2
	
	label.position = Vector2(x_pos, y_pos)
	current_indicators.append(label)
