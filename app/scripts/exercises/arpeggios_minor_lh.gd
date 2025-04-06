# Left hand ascending arpeggios with correct fingerings for all minor triads
extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger
const FingeredNote = preload("res://scripts/models/fingered_note.gd")

static var c_minor_lh_arpeggio = [
	FingeredNote.new("C3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Eb3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Eb3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var d_flat_minor_lh_arpeggio = [
	FingeredNote.new("Db3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Fb3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Db4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Fb3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var g_minor_lh_arpeggio = [
	FingeredNote.new("G3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var d_minor_lh_arpeggio = [
	FingeredNote.new("D3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var a_minor_lh_arpeggio = [
	FingeredNote.new("A3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var e_minor_lh_arpeggio = [
	FingeredNote.new("E3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var b_minor_lh_arpeggio = [
	FingeredNote.new("B2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var f_sharp_minor_lh_arpeggio = [
	FingeredNote.new("F#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var c_sharp_minor_lh_arpeggio = [
	FingeredNote.new("C#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var f_minor_lh_arpeggio = [
	FingeredNote.new("F3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var b_flat_minor_lh_arpeggio = [
	FingeredNote.new("Bb2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Db3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Db3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var e_flat_minor_lh_arpeggio = [
	FingeredNote.new("Eb3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Gb3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Gb3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var a_flat_minor_lh_arpeggio = [
	FingeredNote.new("Ab3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("Cb4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Ab4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Cb4", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var g_sharp_minor_lh_arpeggio = [
	FingeredNote.new("G#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("D#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("D#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var d_sharp_minor_lh_arpeggio = [
	FingeredNote.new("D#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("A#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("A#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var a_sharp_minor_lh_arpeggio = [
	FingeredNote.new("A#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("E#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("E#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.MIDDLE, Hand.LEFT_HAND)
]

static var e_sharp_minor_lh_arpeggio = [
	FingeredNote.new("E#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("B#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E#4", Finger.THUMB, Hand.LEFT_HAND),
	FingeredNote.new("B#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.MIDDLE, Hand.LEFT_HAND)
]
