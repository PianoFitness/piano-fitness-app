class_name PianoNote
extends Resource

@export var pitch: String
@export var hand: MusicalConstants.Hand
@export var finger: int # 1-5

func _init(p: String = "", h: MusicalConstants.Hand = MusicalConstants.Hand.RIGHT, f: int = 1):
	pitch = p
	hand = h
	finger = f
