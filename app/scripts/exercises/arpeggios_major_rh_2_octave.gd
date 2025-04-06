# Right hand ascending arpeggios with correct fingerings for all major triads spanning 2 octaves
extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger
const FingeredNote = preload("res://scripts/models/fingered_note.gd")

static var c_major_rh_arpeggio_2_octave = [
	FingeredNote.new("C4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var g_major_rh_arpeggio_2_octave = [
	FingeredNote.new("G4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("B5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("D6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var d_major_rh_arpeggio_2_octave = [
	FingeredNote.new("D4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("F#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("A5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("D6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var a_major_rh_arpeggio_2_octave = [
	FingeredNote.new("A4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("A5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C#6", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("E6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("A6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var e_major_rh_arpeggio_2_octave = [
	FingeredNote.new("E4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("B5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("E6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var b_major_rh_arpeggio_2_octave = [
	FingeredNote.new("B4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("B5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D#6", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F#6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("B6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var f_sharp_major_rh_arpeggio_2_octave = [
	FingeredNote.new("F#4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C#6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F#6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var c_sharp_major_rh_arpeggio_2_octave = [
	FingeredNote.new("C#4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C#6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var f_major_rh_arpeggio_2_octave = [
	FingeredNote.new("F4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var b_flat_major_rh_arpeggio_2_octave = [
	FingeredNote.new("Bb4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Bb5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D6", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Bb6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var e_flat_major_rh_arpeggio_2_octave = [
	FingeredNote.new("Eb4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Bb4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Eb5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Bb5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Eb6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var a_flat_major_rh_arpeggio_2_octave = [
	FingeredNote.new("Ab4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Eb5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Ab5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C6", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Eb6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Ab6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var g_sharp_major_rh_arpeggio_2_octave = [
	FingeredNote.new("G#4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("B#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("D#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G#5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("B#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("D#6", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G#6", Finger.PINKY, Hand.RIGHT_HAND)
]

static var d_flat_major_rh_arpeggio_2_octave = [
	FingeredNote.new("Db4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("F4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Ab4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Db5", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Ab5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Db6", Finger.PINKY, Hand.RIGHT_HAND)
]
