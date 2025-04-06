extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger
const MusicalConstants = preload("res://scripts/constants/musical_constants.gd")
const NotePosition = preload("res://scripts/models/note_position.gd")

var MajorArpeggiosRH2Octave = preload("res://scripts/exercises/arpeggios_major_rh_2_octave.gd").new()
var MajorArpeggiosLH2Octave = preload("res://scripts/exercises/arpeggios_major_lh_2_octave.gd").new()

var exercises = {
	MusicalConstants.MusicKey.C: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.c_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.c_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.G: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.g_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.g_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.D: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.d_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.d_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.A: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.a_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.a_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.E: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.e_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.e_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.B: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.b_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.b_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.F_SHARP: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.f_sharp_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.f_sharp_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.C_SHARP: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.c_sharp_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.c_sharp_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.G_SHARP: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.g_sharp_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.g_sharp_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.F: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.f_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.f_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.B_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.b_flat_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.b_flat_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.E_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.e_flat_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.e_flat_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.A_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.a_flat_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.a_flat_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.D_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.d_flat_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.d_flat_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.G_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.g_sharp_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.g_sharp_major_lh_arpeggio_2_octave
	},
	MusicalConstants.MusicKey.C_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH2Octave.g_sharp_major_rh_arpeggio_2_octave,
		Hand.LEFT_HAND: MajorArpeggiosLH2Octave.g_sharp_major_lh_arpeggio_2_octave
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
