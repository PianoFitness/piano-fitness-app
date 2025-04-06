# Diatonic arpeggios for all keys
extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger
const MusicalConstants = preload("res://scripts/constants/musical_constants.gd")
const NotePosition = preload("res://scripts/models/note_position.gd")

# Import major, minor, and diminished arpeggios
const MajorArpeggiosRH = preload("res://scripts/exercises/arpeggios_major_rh.gd")
const MinorArpeggiosRH = preload("res://scripts/exercises/arpeggios_minor_rh.gd")
const DiminishedArpeggiosRH = preload("res://scripts/exercises/arpeggios_diminished_rh.gd")
const MajorArpeggiosLH = preload("res://scripts/exercises/arpeggios_major_lh.gd")
const MinorArpeggiosLH = preload("res://scripts/exercises/arpeggios_minor_lh.gd")
const DiminishedArpeggiosLH = preload("res://scripts/exercises/arpeggios_diminished_lh.gd")

var exercises_rh = {
	MusicalConstants.MusicKey.C: {
		"I": MajorArpeggiosRH.c_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.d_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.e_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.f_major_rh_arpeggio,
		"V": MajorArpeggiosRH.g_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.a_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.b_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.G: {
		"I": MajorArpeggiosRH.g_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.a_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.b_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.c_major_rh_arpeggio,
		"V": MajorArpeggiosRH.d_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.e_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.f_sharp_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.D: {
		"I": MajorArpeggiosRH.d_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.e_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.f_sharp_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.g_major_rh_arpeggio,
		"V": MajorArpeggiosRH.a_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.b_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.c_sharp_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.A: {
		"I": MajorArpeggiosRH.a_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.b_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.c_sharp_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.d_major_rh_arpeggio,
		"V": MajorArpeggiosRH.e_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.f_sharp_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.g_sharp_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.E: {
		"I": MajorArpeggiosRH.e_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.f_sharp_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.g_sharp_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.a_major_rh_arpeggio,
		"V": MajorArpeggiosRH.b_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.c_sharp_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.d_sharp_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.B: {
		"I": MajorArpeggiosRH.b_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.c_sharp_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.d_sharp_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.e_major_rh_arpeggio,
		"V": MajorArpeggiosRH.f_sharp_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.g_sharp_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.a_sharp_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.F_SHARP: {
		"I": MajorArpeggiosRH.f_sharp_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.g_sharp_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.a_sharp_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.b_major_rh_arpeggio,
		"V": MajorArpeggiosRH.c_sharp_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.d_sharp_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.e_sharp_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.C_SHARP: {
		"I": MajorArpeggiosRH.c_sharp_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.d_sharp_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.e_sharp_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.f_sharp_major_rh_arpeggio,
		"V": MajorArpeggiosRH.g_sharp_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.a_sharp_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.b_sharp_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.F: {
		"I": MajorArpeggiosRH.f_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.g_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.a_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.b_flat_major_rh_arpeggio,
		"V": MajorArpeggiosRH.c_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.d_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.e_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.B_FLAT: {
		"I": MajorArpeggiosRH.b_flat_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.c_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.d_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.e_flat_major_rh_arpeggio,
		"V": MajorArpeggiosRH.f_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.g_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.a_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.E_FLAT: {
		"I": MajorArpeggiosRH.e_flat_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.f_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.g_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.a_flat_major_rh_arpeggio,
		"V": MajorArpeggiosRH.b_flat_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.c_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.d_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.A_FLAT: {
		"I": MajorArpeggiosRH.a_flat_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.b_flat_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.c_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.d_flat_major_rh_arpeggio,
		"V": MajorArpeggiosRH.e_flat_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.f_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.g_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.D_FLAT: {
		"I": MajorArpeggiosRH.d_flat_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.e_flat_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.f_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.g_flat_major_rh_arpeggio,
		"V": MajorArpeggiosRH.a_flat_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.b_flat_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.c_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.G_FLAT: {
		"I": MajorArpeggiosRH.g_flat_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.a_flat_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.b_flat_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.c_flat_major_rh_arpeggio,
		"V": MajorArpeggiosRH.d_flat_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.e_flat_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.f_diminished_rh_arpeggio
	},
	MusicalConstants.MusicKey.C_FLAT: {
		"I": MajorArpeggiosRH.c_flat_major_rh_arpeggio,
		"ii": MinorArpeggiosRH.d_flat_minor_rh_arpeggio,
		"iii": MinorArpeggiosRH.e_flat_minor_rh_arpeggio,
		"IV": MajorArpeggiosRH.f_flat_major_rh_arpeggio,
		"V": MajorArpeggiosRH.g_flat_major_rh_arpeggio,
		"vi": MinorArpeggiosRH.a_flat_minor_rh_arpeggio,
		"vii°": DiminishedArpeggiosRH.b_flat_diminished_rh_arpeggio
	}
}

var exercises_lh = {
	MusicalConstants.MusicKey.C: {
		"I": MajorArpeggiosLH.c_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.d_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.e_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.f_major_lh_arpeggio,
		"V": MajorArpeggiosLH.g_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.a_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.b_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.G: {
		"I": MajorArpeggiosLH.g_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.a_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.b_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.c_major_lh_arpeggio,
		"V": MajorArpeggiosLH.d_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.e_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.f_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.D: {
		"I": MajorArpeggiosLH.d_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.e_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.f_sharp_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.g_major_lh_arpeggio,
		"V": MajorArpeggiosLH.a_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.b_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.c_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.A: {
		"I": MajorArpeggiosLH.a_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.b_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.c_sharp_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.d_major_lh_arpeggio,
		"V": MajorArpeggiosLH.e_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.f_sharp_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.g_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.E: {
		"I": MajorArpeggiosLH.e_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.f_sharp_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.g_sharp_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.a_major_lh_arpeggio,
		"V": MajorArpeggiosLH.b_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.c_sharp_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.d_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.B: {
		"I": MajorArpeggiosLH.b_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.c_sharp_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.d_sharp_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.e_major_lh_arpeggio,
		"V": MajorArpeggiosLH.f_sharp_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.g_sharp_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.a_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.F_SHARP: {
		"I": MajorArpeggiosLH.f_sharp_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.g_sharp_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.a_sharp_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.b_major_lh_arpeggio,
		"V": MajorArpeggiosLH.c_sharp_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.d_sharp_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.e_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.C_SHARP: {
		"I": MajorArpeggiosLH.c_sharp_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.d_sharp_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.e_sharp_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.f_sharp_major_lh_arpeggio,
		"V": MajorArpeggiosLH.g_sharp_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.a_sharp_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.b_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.F: {
		"I": MajorArpeggiosLH.f_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.g_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.a_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.b_flat_major_lh_arpeggio,
		"V": MajorArpeggiosLH.c_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.d_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.e_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.B_FLAT: {
		"I": MajorArpeggiosLH.b_flat_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.c_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.d_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.e_flat_major_lh_arpeggio,
		"V": MajorArpeggiosLH.f_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.g_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.a_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.E_FLAT: {
		"I": MajorArpeggiosLH.e_flat_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.f_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.g_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.a_flat_major_lh_arpeggio,
		"V": MajorArpeggiosLH.b_flat_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.c_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.d_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.A_FLAT: {
		"I": MajorArpeggiosLH.a_flat_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.b_flat_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.c_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.d_flat_major_lh_arpeggio,
		"V": MajorArpeggiosLH.e_flat_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.f_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.g_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.D_FLAT: {
		"I": MajorArpeggiosLH.d_flat_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.e_flat_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.f_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.g_flat_major_lh_arpeggio,
		"V": MajorArpeggiosLH.a_flat_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.b_flat_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.c_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.G_FLAT: {
		"I": MajorArpeggiosLH.g_flat_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.a_flat_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.b_flat_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.c_flat_major_lh_arpeggio,
		"V": MajorArpeggiosLH.d_flat_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.e_flat_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.f_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.C_FLAT: {
		"I": MajorArpeggiosLH.c_flat_major_lh_arpeggio,
		"ii": MinorArpeggiosLH.d_flat_minor_lh_arpeggio,
		"iii": MinorArpeggiosLH.e_flat_minor_lh_arpeggio,
		"IV": MajorArpeggiosLH.f_flat_major_lh_arpeggio,
		"V": MajorArpeggiosLH.g_flat_major_lh_arpeggio,
		"vi": MinorArpeggiosLH.a_flat_minor_lh_arpeggio,
		"vii°": DiminishedArpeggiosLH.b_flat_diminished_lh_arpeggio
	}
}

func get_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> Array[NotePosition]:
	var note_positions: Array[NotePosition] = []
	var degrees = ["I", "ii", "iii", "IV", "V", "vi", "vii°"]
	var exercises = exercises_rh if hand == Hand.RIGHT_HAND else exercises_lh

	for degree in degrees:
		var exercise = exercises[key][degree]
		for fingered_note in exercise:
			var note_position = NotePosition.new([fingered_note])
			note_positions.append(note_position)

	return note_positions

func has_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> bool:
	var exercises = exercises_rh if hand == Hand.RIGHT_HAND else exercises_lh
	return exercises.has(key)
