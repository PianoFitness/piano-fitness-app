extends GutTest

class TestScalesMajor:
	extends GutTest
	var ScalesMajor = load("res://scripts/exercises/scales_major.gd")
	var MusicalConstants = preload("res://scripts/constants/musical_constants.gd")
	var _scales_major = null

	func before_each():
		_scales_major = ScalesMajor.new()

	func test_scales_major_contains_practice_keys():
		var practice_keys = MusicalConstants.get_practice_keys()
		for key in practice_keys:
			var key_str = MusicalConstants.MUSIC_KEY_STRINGS[key]
			assert(_scales_major.exercises.has(key), "Expected major scales to contain key %s" % [key_str])
