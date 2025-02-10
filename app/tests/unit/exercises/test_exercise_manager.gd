extends GutTest

class TestExerciseManager:
	extends GutTest
	var Hand = load("res://scripts/constants/hand.gd").Hand
	var ExerciseManager = load("res://scripts/exercise_manager.gd")
	var _exercise_manager = null

	func before_each():
		_exercise_manager = ExerciseManager.new()

	func test_get_practice_keys_excludes_expected_keys():
		var expected_keys = [
			MusicalConstants.MusicKey.C,
			MusicalConstants.MusicKey.G,
			MusicalConstants.MusicKey.D,
			MusicalConstants.MusicKey.A,
			MusicalConstants.MusicKey.E,
			MusicalConstants.MusicKey.B,
			MusicalConstants.MusicKey.F_SHARP,
			MusicalConstants.MusicKey.C_SHARP,
			MusicalConstants.MusicKey.F,
			MusicalConstants.MusicKey.B_FLAT,
			MusicalConstants.MusicKey.E_FLAT,
			MusicalConstants.MusicKey.A_FLAT,
			MusicalConstants.MusicKey.D_FLAT,
			MusicalConstants.MusicKey.G_FLAT,
			MusicalConstants.MusicKey.C_FLAT
		]
		var result = _exercise_manager.get_practice_keys()
		assert_eq(result, expected_keys, "Expected get_practice_keys to return the correct list of keys.")
