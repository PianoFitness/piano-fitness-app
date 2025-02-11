# Ensure the diatonic arpeggios exercises are generated correctly
extends GutTest

class TestArpeggiosDiatonic:
	extends GutTest
	var DiatonicArpeggios = load("res://scripts/exercises/arpeggios_diatonic.gd")
	var MusicalConstants = load("res://scripts/autoload/musical_constants.gd")
	var Hand = load("res://scripts/constants/hand.gd").Hand
	var _diatonic_arpeggios = null

	func before_each():
		_diatonic_arpeggios = DiatonicArpeggios.new()

	func test_arpeggios_diatonic_exercises_rh_contains_practice_keys():
		var practice_keys = MusicalConstants.get_practice_keys()
		for key in practice_keys:
			var key_str = MusicalConstants.MUSIC_KEY_STRINGS[key]
			assert(_diatonic_arpeggios.exercises_rh.has(key), "Expected exercises_rh to contain key %s" % [key_str])
	
	func test_get_exercise_for_practice_keys():
		var practice_keys = MusicalConstants.get_practice_keys()
		for key in practice_keys:
			for hand in [Hand.RIGHT_HAND, Hand.LEFT_HAND]:
				var exercise = _diatonic_arpeggios.get_exercise(key, hand)
				var key_str = MusicalConstants.MUSIC_KEY_STRINGS[key]
				assert_not_null(exercise, "Expected non-null exercise for key %s and hand %s" % [key_str, hand])
				assert(exercise.size() > 0, "Expected non-empty exercise for key %s and hand %s" % [key_str, hand])
				for note_position in exercise:
					assert_not_null(note_position, "Expected non-null note position in exercise for key %s and hand %s" % [key_str, hand])
					assert(note_position.notes.size() >= 0, "Expected valid note position in exercise for key %s and hand %s" % [key_str, hand])
