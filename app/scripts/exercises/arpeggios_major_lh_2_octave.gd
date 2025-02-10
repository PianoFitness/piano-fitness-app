# Left hand ascending arpeggios with correct fingerings for all major triads spanning 2 octaves
class_name MajorArpeggiosLH2Octave extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

static var c_major_lh_arpeggio_2_octave = [
	FingeredNote.new("C3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C5", Finger.THUMB, Hand.LEFT_HAND)
]

static var g_major_lh_arpeggio_2_octave = [
	FingeredNote.new("G3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("B4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("D5", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G5", Finger.THUMB, Hand.LEFT_HAND)
]

static var d_major_lh_arpeggio_2_octave = [
	FingeredNote.new("D3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("A4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D5", Finger.THUMB, Hand.LEFT_HAND)
]

static var a_major_lh_arpeggio_2_octave = [
	FingeredNote.new("A3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C#5", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("E5", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A5", Finger.THUMB, Hand.LEFT_HAND)
]

static var e_major_lh_arpeggio_2_octave = [
	FingeredNote.new("E3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("B4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E5", Finger.THUMB, Hand.LEFT_HAND)
]

static var b_major_lh_arpeggio_2_octave = [
	FingeredNote.new("B2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("B4", Finger.THUMB, Hand.LEFT_HAND)
]

static var f_sharp_major_lh_arpeggio_2_octave = [
	FingeredNote.new("F#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F#4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C#5", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F#5", Finger.THUMB, Hand.LEFT_HAND)
]

static var c_sharp_major_lh_arpeggio_2_octave = [
	FingeredNote.new("C#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C#5", Finger.THUMB, Hand.LEFT_HAND)
]

static var f_major_lh_arpeggio_2_octave = [
	FingeredNote.new("F3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C5", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F5", Finger.THUMB, Hand.LEFT_HAND)
]

static var b_flat_major_lh_arpeggio_2_octave = [
	FingeredNote.new("Bb2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Bb4", Finger.THUMB, Hand.LEFT_HAND)
]

static var e_flat_major_lh_arpeggio_2_octave = [
	FingeredNote.new("Eb3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Bb4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Eb5", Finger.THUMB, Hand.LEFT_HAND)
]

static var a_flat_major_lh_arpeggio_2_octave = [
	FingeredNote.new("Ab3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Ab4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C5", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Eb5", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Ab5", Finger.THUMB, Hand.LEFT_HAND)
]

static var g_sharp_major_lh_arpeggio_2_octave = [
	FingeredNote.new("G#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("B#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("D#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G#4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("B#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("D#5", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G#5", Finger.THUMB, Hand.LEFT_HAND)
]

static var d_flat_major_lh_arpeggio_2_octave = [
	FingeredNote.new("Db3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Ab3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Db4", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Ab4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Db5", Finger.THUMB, Hand.LEFT_HAND)
]
