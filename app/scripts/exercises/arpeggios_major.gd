const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

var MajorArpeggiosLH = preload("res://scripts/exercises/arpeggios_major_lh.gd").new()
var MajorArpeggiosRH = preload("res://scripts/exercises/arpeggios_major_rh.gd").new()

var exercises = {
	MusicalConstants.MusicKey.C: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.c_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.c_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.G: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.g_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.g_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.D: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.d_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.d_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.A: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.a_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.a_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.E: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.e_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.e_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.B: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.b_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.b_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.F_SHARP: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.f_sharp_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.f_sharp_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.C_SHARP: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.c_sharp_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.c_sharp_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.F: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.f_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.f_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.B_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.b_flat_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.b_flat_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.E_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.e_flat_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.e_flat_major_lh_arpeggio
	},
	MusicalConstants.MusicKey.A_FLAT: {
		Hand.RIGHT_HAND: MajorArpeggiosRH.a_flat_major_rh_arpeggio,
		Hand.LEFT_HAND: MajorArpeggiosLH.a_flat_major_lh_arpeggio
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