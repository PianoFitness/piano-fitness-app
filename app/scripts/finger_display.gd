class_name FingerDisplay
extends Node2D

const LEFT_HAND_COLOR = Color(0.8, 0.8, 0.8, 1.0)
const RIGHT_HAND_COLOR = Color(0.8, 0.8, 0.8, 1.0)
const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0)
const BACKGROUND_COLOR = Color(0.1, 0.1, 0.1, 1.0)
const BACKGROUND_HEIGHT = 40

var current_indicators: Array = []
var background_rect: ColorRect
var font: Font

func _ready():
	font = ThemeDB.fallback_font
	setup_background()

func setup_background():
	background_rect = ColorRect.new()
	background_rect.color = BACKGROUND_COLOR
	add_child(background_rect)
	
	# Ensure background is drawn behind indicators
	background_rect.z_index = -1
	
	call_deferred("update_background_size")

func _process(_delta):
	update_background_size()

func update_background_size():
	if background_rect:
		var viewport_size = get_viewport_rect().size
		background_rect.size = Vector2(viewport_size.x, BACKGROUND_HEIGHT)
		# Position the background at the bottom of the display area
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
	
	# Calculate centered position with precise offset
	var x_pos = key_rect.position.x + (key_rect.size.x / 2) - (label.size.x / 2)
	var y_pos = -BACKGROUND_HEIGHT/2 - label.size.y/2
	
	label.position = Vector2(x_pos, y_pos)
	current_indicators.append(label)
