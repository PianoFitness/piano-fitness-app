const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

var MinorArpeggiosRH = preload("res://scripts/exercises/arpeggios_minor_rh.gd").new()
var MinorArpeggiosLH = preload("res://scripts/exercises/arpeggios_minor_lh.gd").new()

var exercises = {
	MusicalConstants.MusicKey.C: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.c_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.c_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.G: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.g_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.g_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.D: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.d_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.d_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.A: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.a_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.a_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.E: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.e_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.e_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.B: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.b_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.b_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.F_SHARP: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.f_sharp_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.f_sharp_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.C_SHARP: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.c_sharp_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.c_sharp_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.F: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.f_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.f_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.B_FLAT: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.b_flat_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.b_flat_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.E_FLAT: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.e_flat_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.e_flat_minor_lh_arpeggio
	},
	MusicalConstants.MusicKey.A_FLAT: {
		Hand.RIGHT_HAND: MinorArpeggiosRH.a_flat_minor_rh_arpeggio,
		Hand.LEFT_HAND: MinorArpeggiosLH.a_flat_minor_lh_arpeggio
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
