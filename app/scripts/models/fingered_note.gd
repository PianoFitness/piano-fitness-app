class_name FingeredNote
extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

var pitch: String
var finger: Finger
var hand: Hand

func _init(pitch: String, finger: Finger, hand: Hand):
	self.pitch = pitch
	self.finger = finger
	self.hand = hand
