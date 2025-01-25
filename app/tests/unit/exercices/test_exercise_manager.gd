extends GutTest

class TestExerciseManager:
	extends GutTest
	
	var ExerciseManager = load("res://scripts/exercise_manager.gd")
	var _exercise_manager = null

	func before_each():
		_exercise_manager = ExerciseManager.new()

	func test_create_scale_returns_valid_sequence():
		var result = _exercise_manager.create_scale(
			MusicalConstants.MusicKey.C,
			"right_hand",
			MusicalConstants.Hand.RIGHT
		)
		assert_not_null(result, "Expected a valid PracticeSequence instance.")
		assert_eq("scale", result.exercise_type, "Unexpected exercise_type value.")
		assert_gt(result.sequence.size(), 0, "Expected at least one note in the sequence.")

	func test_create_chord_inversions_returns_valid_sequence():
		var result = _exercise_manager.create_chord_inversions(
			MusicalConstants.MusicKey.C,
			"right_hand",
			MusicalConstants.Hand.RIGHT
		)
		assert_not_null(result, "Expected a valid PracticeSequence instance.")
		assert_eq("chord_inversions", result.exercise_type, "Unexpected exercise_type value.")
		assert_gt(result.sequence.size(), 0, "Expected at least one chord in the sequence.")

	func test_create_arpeggios_returns_valid_sequence():
		var result = _exercise_manager.create_arpeggios(
			MusicalConstants.MusicKey.C,
			"right_hand",
			MusicalConstants.Hand.RIGHT
		)
		assert_not_null(result, "Expected a valid PracticeSequence instance.")
		assert_eq("arpeggio", result.exercise_type, "Unexpected exercise_type value.")
		assert_gt(result.sequence.size(), 0, "Expected at least one arpeggio in the sequence.")
