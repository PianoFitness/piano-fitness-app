class_name PianoNote
extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand

@export var pitch: String
@export var hand: Hand
@export var finger: int # 1-5

func _init(p: String = "", h: Hand = Hand.RIGHT_HAND, f: int = 1):
	pitch = p
	hand = h
	finger = f
