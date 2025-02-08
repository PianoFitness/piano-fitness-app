# Left hand ascending arpeggios with correct fingerings for all diminished triads
class_name DiminishedArpeggiosLH extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

static var c_diminished_lh_arpeggio = [
	FingeredNote.new("C3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Eb3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Gb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Gb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Eb3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var g_diminished_lh_arpeggio = [
	FingeredNote.new("G3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Db4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Db4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var d_diminished_lh_arpeggio = [
	FingeredNote.new("D3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var a_diminished_lh_arpeggio = [
	FingeredNote.new("A3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var e_diminished_lh_arpeggio = [
	FingeredNote.new("E3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var b_diminished_lh_arpeggio = [
	FingeredNote.new("B2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var f_sharp_diminished_lh_arpeggio = [
	FingeredNote.new("F#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var c_sharp_diminished_lh_arpeggio = [
	FingeredNote.new("C#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var f_diminished_lh_arpeggio = [
	FingeredNote.new("F3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var b_flat_diminished_lh_arpeggio = [
	FingeredNote.new("Bb2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Db3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Db3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var e_flat_diminished_lh_arpeggio = [
	FingeredNote.new("Eb3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Gb3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Gb3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var a_flat_diminished_lh_arpeggio = [
	FingeredNote.new("Ab3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Cb4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Ab4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Cb4", Finger.MIDDLE, Hand.LEFT_HAND)
]
