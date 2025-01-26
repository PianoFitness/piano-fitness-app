class_name FingeredNote
extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

var note_name: String
var finger: Finger
var hand: Hand

func _init(note_name: String, finger: Finger, hand: Hand):
	self.note_name = note_name
	self.finger = finger
	self.hand = hand
