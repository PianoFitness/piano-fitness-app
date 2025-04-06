extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

var pitch: String
var finger: Finger = Finger.THUMB
var hand: Hand

func _init(_pitch: String, _finger: Finger, _hand: Hand):
	self.pitch = _pitch
	self.finger = _finger
	self.hand = _hand
