class_name DiminishedArpeggioExercises extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand
const Finger = preload("res://scripts/constants/finger.gd").Finger

# Import right-hand and left-hand diminished arpeggios
const RH_Arpeggios = preload("res://scripts/exercises/arpeggios_diminished_rh.gd")
const LH_Arpeggios = preload("res://scripts/exercises/arpeggios_diminished_lh.gd")

var exercises = {
	MusicalConstants.MusicKey.C: {
		Hand.RIGHT_HAND: RH_Arpeggios.c_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.c_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.G: {
		Hand.RIGHT_HAND: RH_Arpeggios.g_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.g_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.D: {
		Hand.RIGHT_HAND: RH_Arpeggios.d_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.d_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.A: {
		Hand.RIGHT_HAND: RH_Arpeggios.a_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.a_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.E: {
		Hand.RIGHT_HAND: RH_Arpeggios.e_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.e_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.B: {
		Hand.RIGHT_HAND: RH_Arpeggios.b_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.b_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.F_SHARP: {
		Hand.RIGHT_HAND: RH_Arpeggios.f_sharp_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.f_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.C_SHARP: {
		Hand.RIGHT_HAND: RH_Arpeggios.c_sharp_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.c_sharp_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.F: {
		Hand.RIGHT_HAND: RH_Arpeggios.f_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.f_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.B_FLAT: {
		Hand.RIGHT_HAND: RH_Arpeggios.b_flat_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.b_flat_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.E_FLAT: {
		Hand.RIGHT_HAND: RH_Arpeggios.e_flat_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.e_flat_diminished_lh_arpeggio
	},
	MusicalConstants.MusicKey.A_FLAT: {
		Hand.RIGHT_HAND: RH_Arpeggios.a_flat_diminished_rh_arpeggio,
		Hand.LEFT_HAND: LH_Arpeggios.a_flat_diminished_lh_arpeggio
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
