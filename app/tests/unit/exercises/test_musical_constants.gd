extends GutTest

class TestExerciseManager:
	extends GutTest
	var Hand = load("res://scripts/constants/hand.gd").Hand
	var MusicalConstants = preload("res://scripts/constants/musical_constants.gd")


	func test_get_practice_keys_excludes_expected_keys():
		"""Test that the excluded keys are not included in the practice keys."""
		var result = MusicalConstants.get_practice_keys()
		
		for key in MusicalConstants.EXCLUDED_PRACTICE_KEYS:
			assert(!result.has(key), "Expected result to exclude key %s" % [MusicalConstants.MUSIC_KEY_STRINGS[key]])

	func test_get_practice_keys_includes_all_other_keys():
		"""Test that all keys are included in the practice keys except for the excluded keys."""
		var result = MusicalConstants.get_practice_keys()
		
		for key in MusicalConstants.MUSIC_KEY_STRINGS.keys():
			if (!MusicalConstants.EXCLUDED_PRACTICE_KEYS.has(key)):
				assert(result.has(key), "Expected result to include key %s" % [MusicalConstants.MUSIC_KEY_STRINGS[key]])
