class_name ArpeggioExercises extends Resource
# Right hand ascending arpeggios with correct fingerings for all major triads

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger
const FingeredNote = preload("res://scripts/models/fingered_note.gd")
const NotePosition = preload("res://scripts/models/note_position.gd")

var c_major_rh_arpeggios = [
	FingeredNote.new("C4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.PINKY, Hand.RIGHT_HAND)
]

var g_major_rh_arpeggios = [
	FingeredNote.new("G4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("G5", Finger.PINKY, Hand.RIGHT_HAND)
]

var d_major_rh_arpeggios = [
	FingeredNote.new("D4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("F#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.PINKY, Hand.RIGHT_HAND)
]

var a_major_rh_arpeggios = [
	FingeredNote.new("A4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("A5", Finger.PINKY, Hand.RIGHT_HAND)
]

var e_major_rh_arpeggios = [
	FingeredNote.new("E4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("B4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("E5", Finger.PINKY, Hand.RIGHT_HAND)
]

var b_major_rh_arpeggios = [
	FingeredNote.new("B4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D#5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("B5", Finger.PINKY, Hand.RIGHT_HAND)
]

var f_sharp_major_rh_arpeggios = [
	FingeredNote.new("F#4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F#5", Finger.PINKY, Hand.RIGHT_HAND)
]

var c_sharp_major_rh_arpeggios = [
	FingeredNote.new("C#4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("E#4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("G#4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("C#5", Finger.PINKY, Hand.RIGHT_HAND)
]

var f_major_rh_arpeggios = [
	FingeredNote.new("F4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("A4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.PINKY, Hand.RIGHT_HAND)
]

var b_flat_major_rh_arpeggios = [
	FingeredNote.new("Bb4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("D5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("F5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Bb5", Finger.PINKY, Hand.RIGHT_HAND)
]

var e_flat_major_rh_arpeggios = [
	FingeredNote.new("Eb4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("G4", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Bb4", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Eb5", Finger.PINKY, Hand.RIGHT_HAND)
]

var a_flat_major_rh_arpeggios = [
	FingeredNote.new("Ab4", Finger.THUMB, Hand.RIGHT_HAND),
	FingeredNote.new("C5", Finger.INDEX, Hand.RIGHT_HAND),
	FingeredNote.new("Eb5", Finger.MIDDLE, Hand.RIGHT_HAND),
	FingeredNote.new("Ab5", Finger.PINKY, Hand.RIGHT_HAND)
]

# Left hand ascending arpeggios with correct fingerings for all major triads

var c_major_lh_arpeggios = [
	FingeredNote.new("C3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.THUMB, Hand.LEFT_HAND)
]

var g_major_lh_arpeggios = [
	FingeredNote.new("G3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("G4", Finger.THUMB, Hand.LEFT_HAND)
]

var d_major_lh_arpeggios = [
	FingeredNote.new("D3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("D4", Finger.THUMB, Hand.LEFT_HAND)
]

var a_major_lh_arpeggios = [
	FingeredNote.new("A3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("A4", Finger.THUMB, Hand.LEFT_HAND)
]

var e_major_lh_arpeggios = [
	FingeredNote.new("E3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("E4", Finger.THUMB, Hand.LEFT_HAND)
]

var b_major_lh_arpeggios = [
	FingeredNote.new("B2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("B3", Finger.THUMB, Hand.LEFT_HAND)
]

var f_sharp_major_lh_arpeggios = [
	FingeredNote.new("F#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F#4", Finger.THUMB, Hand.LEFT_HAND)
]

var c_sharp_major_lh_arpeggios = [
	FingeredNote.new("C#3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("E#3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("G#3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("C#4", Finger.THUMB, Hand.LEFT_HAND)
]

var f_major_lh_arpeggios = [
	FingeredNote.new("F3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("F4", Finger.THUMB, Hand.LEFT_HAND)
]

var b_flat_major_lh_arpeggios = [
	FingeredNote.new("Bb2", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("D3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("F3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.THUMB, Hand.LEFT_HAND)
]

var e_flat_major_lh_arpeggios = [
	FingeredNote.new("Eb3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Bb3", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.THUMB, Hand.LEFT_HAND)
]

var a_flat_major_lh_arpeggios = [
	FingeredNote.new("Ab3", Finger.PINKY, Hand.LEFT_HAND),
	FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND),
	FingeredNote.new("Eb4", Finger.INDEX, Hand.LEFT_HAND),
	FingeredNote.new("Ab4", Finger.THUMB, Hand.LEFT_HAND)
]

var exercises = {
	MusicalConstants.MusicKey.C: {
		Hand.RIGHT_HAND: c_major_rh_arpeggios,
		Hand.LEFT_HAND: c_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.G: {
		Hand.RIGHT_HAND: g_major_rh_arpeggios,
		Hand.LEFT_HAND: g_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.D: {
		Hand.RIGHT_HAND: d_major_rh_arpeggios,
		Hand.LEFT_HAND: d_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.A: {
		Hand.RIGHT_HAND: a_major_rh_arpeggios,
		Hand.LEFT_HAND: a_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.E: {
		Hand.RIGHT_HAND: e_major_rh_arpeggios,
		Hand.LEFT_HAND: e_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.B: {
		Hand.RIGHT_HAND: b_major_rh_arpeggios,
		Hand.LEFT_HAND: b_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.F_SHARP: {
		Hand.RIGHT_HAND: f_sharp_major_rh_arpeggios,
		Hand.LEFT_HAND: f_sharp_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.C_SHARP: {
		Hand.RIGHT_HAND: c_sharp_major_rh_arpeggios,
		Hand.LEFT_HAND: c_sharp_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.F: {
		Hand.RIGHT_HAND: f_major_rh_arpeggios,
		Hand.LEFT_HAND: f_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.B_FLAT: {
		Hand.RIGHT_HAND: b_flat_major_rh_arpeggios,
		Hand.LEFT_HAND: b_flat_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.E_FLAT: {
		Hand.RIGHT_HAND: e_flat_major_rh_arpeggios,
		Hand.LEFT_HAND: e_flat_major_lh_arpeggios
	},
	MusicalConstants.MusicKey.A_FLAT: {
		Hand.RIGHT_HAND: a_flat_major_rh_arpeggios,
		Hand.LEFT_HAND: a_flat_major_lh_arpeggios
	}
}

func get_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> Array[NotePosition]:
	var exercise = exercises[key][hand]

	var note_positions: Array[NotePosition] = []
	for fingered_note in exercise:
		var note_position = NotePosition.new([fingered_note])
		note_positions.append(note_position)

	return note_positions

func has_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> bool:
	return exercises.has(key) and exercises[key].has(hand)