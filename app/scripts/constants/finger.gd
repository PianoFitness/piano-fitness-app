const Hand = preload("res://scripts/constants/hand.gd").Hand

enum Finger {
	THUMB = 1,
	INDEX = 2,
	MIDDLE = 3,
	RING = 4,
	PINKY = 5
}

var finger_names = {
	Finger.THUMB: "THUMB",
	Finger.INDEX: "INDEX",
	Finger.MIDDLE: "MIDDLE",
	Finger.RING: "RING",
	Finger.PINKY: "PINKY"
}

func get_finger_number(finger: Finger) -> int:
	return int(finger)

func get_finger_name(finger: Finger) -> String:
	return finger_names[finger]
