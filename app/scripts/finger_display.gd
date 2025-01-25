class_name FingerDisplay
extends Node2D

const BACKGROUND_HEIGHT = 40

const KEY_ADJUSTMENTS = {
	"C": -2,   # Slight left adjustment
	"D": -3,   
	"E": -2,   
	"F": -2,   
	"G": -3,   
	"A": -3,   
	"B": -2,   
	"C#": -4,  # Black keys
	"D#": -4,
	"F#": -4,
	"G#": -4,
	"A#": -4
}

var background_rect: ColorRect
var finger_labels: Array[Label] = []

func _ready():
	setup_background()
	var sequence_manager = get_parent().get_node("SequenceManager")
	sequence_manager.connect("clear_finger_indicators", _on_clear_finger_indicators)
	sequence_manager.connect("add_finger_indicator", _on_add_finger_indicator)

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
	for label in finger_labels:
		label.queue_free()
	finger_labels.clear()

func add_finger_indicator(note: PianoNote, is_current: bool = false):
	var piano_keys = get_parent().get_node("PianoKeys")
	var key_rect = piano_keys.get_key_rect_by_name(note.pitch)
	
	var label = Label.new()
	label.text = str(note.finger)
	label.add_theme_font_size_override("font_size", 24)
	
	var color = Colors.RIGHT_HAND_COLOR if note.hand == MusicalConstants.Hand.RIGHT else Colors.LEFT_HAND_COLOR
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

func _on_clear_finger_indicators():
	clear_indicators()

func _on_add_finger_indicator(note: PianoNote, is_current: bool):
	add_finger_indicator(note, is_current)
