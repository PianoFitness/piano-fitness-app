class_name FingerDisplay
extends Node2D

const LEFT_HAND_COLOR = Color(0.8, 0.8, 0.8, 1.0)
const RIGHT_HAND_COLOR = Color(0.8, 0.8, 0.8, 1.0)
const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0)  # Green for current note
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
	call_deferred("update_background_size")

func _process(_delta):
	update_background_size()

func update_background_size():
	if background_rect:
		var viewport_size = get_viewport_rect().size
		background_rect.size = Vector2(viewport_size.x, BACKGROUND_HEIGHT)
		# Position directly above piano keys
		background_rect.position = Vector2(0, 0)

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
	
	# Use lesson color for current note, regular color for others
	var color = LESSON_COLOR if is_current else (RIGHT_HAND_COLOR if note.hand == "R" else LEFT_HAND_COLOR)
	label.add_theme_color_override("font_color", color)
	
	# Position calculation relative to key
	var x_pos = key_rect.position.x + (key_rect.size.x - label.size.x) / 2
	var y_pos = BACKGROUND_HEIGHT/2 - label.size.y/2  # Center in background bar
	
	label.position = Vector2(x_pos, y_pos)
	add_child(label)
	current_indicators.append(label)
