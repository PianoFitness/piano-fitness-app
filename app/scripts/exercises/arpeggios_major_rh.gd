# Right hand ascending arpeggios with correct fingerings for all major triads

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

static var c_major_rh_arpeggio = [
	FingeredNote.new("C4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var g_major_rh_arpeggio = [
	FingeredNote.new("G4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var d_major_rh_arpeggio = [
	FingeredNote.new("D4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("F#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F#4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var a_major_rh_arpeggio = [
	FingeredNote.new("A4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("A5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.INDEX, Hand.RIGHT_HAND)
]

static var e_major_rh_arpeggio = [
	FingeredNote.new("E4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var b_major_rh_arpeggio = [
	FingeredNote.new("B4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("B5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("D#5", Finger.INDEX, Hand.RIGHT_HAND)
]

static var f_sharp_major_rh_arpeggio = [
	FingeredNote.new("F#4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("A#4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var c_sharp_major_rh_arpeggio = [
	FingeredNote.new("C#4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("E#4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var f_major_rh_arpeggio = [
	FingeredNote.new("F4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var b_flat_major_rh_arpeggio = [
	FingeredNote.new("Bb4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Bb5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.INDEX, Hand.RIGHT_HAND)
]

static var e_flat_major_rh_arpeggio = [
	FingeredNote.new("Eb4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Bb4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Eb5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("Bb4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.INDEX, Hand.RIGHT_HAND)
]

static var a_flat_major_rh_arpeggio = [
	FingeredNote.new("Ab4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Eb5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Ab5", Finger.PINKY, Hand.RIGHT_HAND),
	FingeredNote.new("Eb5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.INDEX, Hand.RIGHT_HAND)
]
