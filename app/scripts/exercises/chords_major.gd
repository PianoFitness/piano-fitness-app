class_name ChordExercises extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger
const FingeredNote = preload("res://scripts/models/fingered_note.gd")
const NotePosition = preload("res://scripts/models/note_position.gd")

var c_major_rh_inversions: Array[NotePosition] = [
	# Root position: C4(1) - E4(3) - G4(5)
	NotePosition.new([
		FingeredNote.new("C4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("E4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("G4", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: E4(1) - G4(2) - C5(5)
	NotePosition.new([
		FingeredNote.new("E4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("G4", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("C5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: G4(1) - C5(3) - E5(5)
	NotePosition.new([
		FingeredNote.new("G4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("C5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("E5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var g_major_rh_inversions: Array[NotePosition] = [
	# Root position: G4(1) - B4(3) - D5(5)
	NotePosition.new([
		FingeredNote.new("G4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("B4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("D5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: B4(1) - D5(2) - G5(5)
	NotePosition.new([
		FingeredNote.new("B4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("D5", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("G5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: D4(1) - G4(3) - B4(5)
	NotePosition.new([
		FingeredNote.new("D4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("G4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("B4", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var d_major_rh_inversions: Array[NotePosition] = [
	# Root position: D4(1) - F#4(3) - A4(5)
	NotePosition.new([
		FingeredNote.new("D4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("F#4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("A4", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: F#4(1) - A4(2) - D5(5)
	NotePosition.new([
		FingeredNote.new("F#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("A4", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("D5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: A4(1) - D5(3) - F#5(5)
	NotePosition.new([
		FingeredNote.new("A4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("D5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("F#5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var a_major_rh_inversions: Array[NotePosition] = [
	# Root position: A4(1) - C#5(3) - E5(5)
	NotePosition.new([
		FingeredNote.new("A4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("C#5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("E5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: C#5(1) - E5(2) - A5(5)
	NotePosition.new([
		FingeredNote.new("C#5", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("E5", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("A5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: E4(1) - A4(3) - C#5(5)
	NotePosition.new([
		FingeredNote.new("E4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("A4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("C#5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var e_major_rh_inversions: Array[NotePosition] = [
	# Root position: E4(1) - G#4(3) - B4(5)
	NotePosition.new([
		FingeredNote.new("E4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("G#4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("B4", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: G#4(1) - B4(2) - E5(5)
	NotePosition.new([
		FingeredNote.new("G#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("B4", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("E5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: B4(1) - E5(3) - G#5(5)
	NotePosition.new([
		FingeredNote.new("B4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("E5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("G#5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var b_major_rh_inversions: Array[NotePosition] = [
	# Root position: B4(1) - D#5(3) - F#5(5)
	NotePosition.new([
		FingeredNote.new("B4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("D#5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("F#5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: D#5(1) - F#5(2) - B5(5)
	NotePosition.new([
		FingeredNote.new("D#5", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("F#5", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("B5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: F#4(1) - B4(3) - D#5(5)
	NotePosition.new([
		FingeredNote.new("F#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("B4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("D#5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var f_sharp_major_rh_inversions: Array[NotePosition] = [
	# Root position: F#4(1) - A#4(3) - C#5(5)
	NotePosition.new([
		FingeredNote.new("F#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("A#4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("C#5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: A#4(1) - C#5(2) - F#5(5)
	NotePosition.new([
		FingeredNote.new("A#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("C#5", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("F#5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: C#4(1) - F#4(3) - A#4(5)
	NotePosition.new([
		FingeredNote.new("C#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("F#4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("A#4", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var c_sharp_major_rh_inversions: Array[NotePosition] = [
	# Root position: C#4(1) - E#4(3) - G#4(5)
	NotePosition.new([
		FingeredNote.new("C#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("E#4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("G#4", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: E#4(1) - G#4(2) - C#5(5)
	NotePosition.new([
		FingeredNote.new("E#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("G#4", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("C#5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: G#4(1) - C#5(3) - E#5(5)
	NotePosition.new([
		FingeredNote.new("G#4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("C#5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("E#5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var f_major_rh_inversions: Array[NotePosition] = [
	# Root position: F4(1) - A4(3) - C5(5)
	NotePosition.new([
		FingeredNote.new("F4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("A4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("C5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: A4(1) - C5(2) - F5(5)
	NotePosition.new([
		FingeredNote.new("A4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("C5", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("F5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: C4(1) - F4(3) - A4(5)
	NotePosition.new([
		FingeredNote.new("C4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("F4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("A4", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var b_flat_major_rh_inversions: Array[NotePosition] = [
	# Root position: Bb4(1) - D5(3) - F5(5)
	NotePosition.new([
		FingeredNote.new("Bb4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("D5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("F5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: D5(1) - F5(2) - Bb5(5)
	NotePosition.new([
		FingeredNote.new("D5", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("F5", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("Bb5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: F4(1) - Bb4(3) - D5(5)
	NotePosition.new([
		FingeredNote.new("F4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("Bb4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("D5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var e_flat_major_rh_inversions: Array[NotePosition] = [
	# Root position: Eb4(1) - G4(3) - Bb4(5)
	NotePosition.new([
		FingeredNote.new("Eb4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("G4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("Bb4", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: G4(1) - Bb4(2) - Eb5(5)
	NotePosition.new([
		FingeredNote.new("G4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("Bb4", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("Eb5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: Bb4(1) - Eb5(3) - G5(5)
	NotePosition.new([
		FingeredNote.new("Bb4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("Eb5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("G5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var a_flat_major_rh_inversions: Array[NotePosition] = [
	# Root position: Ab4(1) - C5(3) - Eb5(5)
	NotePosition.new([
		FingeredNote.new("Ab4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("C5", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("Eb5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# First inversion: C5(1) - Eb5(2) - Ab5(5)
	NotePosition.new([
		FingeredNote.new("C5", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("Eb5", Finger.INDEX, Hand.RIGHT_HAND),
		FingeredNote.new("Ab5", Finger.PINKY, Hand.RIGHT_HAND)
	]),
	# Second inversion: Eb4(1) - Ab4(3) - C5(5)
	NotePosition.new([
		FingeredNote.new("Eb4", Finger.THUMB, Hand.RIGHT_HAND),
		FingeredNote.new("Ab4", Finger.MIDDLE, Hand.RIGHT_HAND),
		FingeredNote.new("C5", Finger.PINKY, Hand.RIGHT_HAND)
	])
]

var c_major_lh_inversions: Array[NotePosition] = [
	# Root position: C3(5) - E3(3) - G3(1)
	NotePosition.new([
		FingeredNote.new("C3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("E3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("G3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion: E3(5) - G3(2) - C4(1)
	NotePosition.new([
		FingeredNote.new("E3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("G3", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("C4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion: G3(5) - C4(3) - E4(1)
	NotePosition.new([
		FingeredNote.new("G3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("E4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var f_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("F3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("C4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("A3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("C4", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("F4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("C3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("F3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("A3", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var b_flat_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("Bb2", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("D3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("F3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("D3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("F3", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("Bb3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("F3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("Bb3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("D4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var e_flat_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("Eb3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("Bb3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("G3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("Bb3", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("Eb4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("Bb3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("Eb4", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("G4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var a_flat_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("Ab3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("C4", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("Eb4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("C4", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("Eb4", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("Ab4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("Eb3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("Ab3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("C4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var g_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("G3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("B3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("D4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("B3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("D4", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("G4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("D3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("G3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("B3", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var d_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("D3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("F#3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("A3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("F#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("A3", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("D4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("A3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("D4", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("F#4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var a_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("A3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("C#4", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("E4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("C#4", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("E4", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("A4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("E3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("A3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("C#4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var e_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("E3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("G#3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("B3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("G#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("B3", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("E4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("B3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("E4", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("G#4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var b_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("B2", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("D#3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("F#3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("D#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("F#3", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("B3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("F#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("B3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("D#4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var f_sharp_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("F#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("A#3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("C#4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("A#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("C#4", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("F#4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("C#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("F#3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("A#3", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var c_sharp_major_lh_inversions: Array[NotePosition] = [
	# Root position
	NotePosition.new([
		FingeredNote.new("C#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("E#3", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("G#3", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# First inversion
	NotePosition.new([
		FingeredNote.new("E#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("G#3", Finger.INDEX, Hand.LEFT_HAND),
		FingeredNote.new("C#4", Finger.THUMB, Hand.LEFT_HAND)
	]),
	# Second inversion
	NotePosition.new([
		FingeredNote.new("G#3", Finger.PINKY, Hand.LEFT_HAND),
		FingeredNote.new("C#4", Finger.MIDDLE, Hand.LEFT_HAND),
		FingeredNote.new("E#4", Finger.THUMB, Hand.LEFT_HAND)
	])
]

var exercises: Dictionary = {
	MusicalConstants.MusicKey.C: {
		Hand.RIGHT_HAND: c_major_rh_inversions,
		Hand.LEFT_HAND: c_major_lh_inversions
	},
	MusicalConstants.MusicKey.G: {
		Hand.RIGHT_HAND: g_major_rh_inversions,
		Hand.LEFT_HAND: g_major_lh_inversions
	},
	MusicalConstants.MusicKey.D: {
		Hand.RIGHT_HAND: d_major_rh_inversions,
		Hand.LEFT_HAND: d_major_lh_inversions
	},
	MusicalConstants.MusicKey.A: {
		Hand.RIGHT_HAND: a_major_rh_inversions,
		Hand.LEFT_HAND: a_major_lh_inversions
	},
	MusicalConstants.MusicKey.E: {
		Hand.RIGHT_HAND: e_major_rh_inversions,
		Hand.LEFT_HAND: e_major_lh_inversions
	},
	MusicalConstants.MusicKey.B: {
		Hand.RIGHT_HAND: b_major_rh_inversions,
		Hand.LEFT_HAND: b_major_lh_inversions
	},
	MusicalConstants.MusicKey.F_SHARP: {
		Hand.RIGHT_HAND: f_sharp_major_rh_inversions,
		Hand.LEFT_HAND: f_sharp_major_lh_inversions
	},
	MusicalConstants.MusicKey.C_SHARP: {
		Hand.RIGHT_HAND: c_sharp_major_rh_inversions,
		Hand.LEFT_HAND: c_sharp_major_lh_inversions
	},
	MusicalConstants.MusicKey.F: {
		Hand.RIGHT_HAND: f_major_rh_inversions,
		Hand.LEFT_HAND: f_major_lh_inversions
	},
	MusicalConstants.MusicKey.B_FLAT: {
		Hand.RIGHT_HAND: b_flat_major_rh_inversions,
		Hand.LEFT_HAND: b_flat_major_lh_inversions
	},
	MusicalConstants.MusicKey.E_FLAT: {
		Hand.RIGHT_HAND: e_flat_major_rh_inversions,
		Hand.LEFT_HAND: e_flat_major_lh_inversions
	},
	MusicalConstants.MusicKey.A_FLAT: {
		Hand.RIGHT_HAND: a_flat_major_rh_inversions,
		Hand.LEFT_HAND: a_flat_major_lh_inversions
	}
}

func get_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> Array[NotePosition]:
	return exercises[key][hand]

func has_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> bool:
	return exercises.has(key) and exercises[key].has(hand)
