class_name PianoNote
extends Resource

@export var pitch: String
@export var hand: String  # "L" or "R"
@export var finger: int   # 1-5

func _init(p: String = "", h: String = "R", f: int = 1):
	pitch = p
	hand = h
	finger = f
