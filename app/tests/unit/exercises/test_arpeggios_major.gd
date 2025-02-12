extends GutTest

class TestArpeggiosMajor:
	extends GutTest
	var ArpeggiosMajor = load("res://scripts/exercises/arpeggios_major.gd")
	var MusicalConstants = load("res://scripts/autoload/musical_constants.gd")
	var _major_arpeggios = null

	func before_each():
		_major_arpeggios = ArpeggiosMajor.new()

	func test_major_arpeggios_contains_practice_keys():
		var practice_keys = MusicalConstants.get_practice_keys()
		for key in practice_keys:
			var key_str = MusicalConstants.MUSIC_KEY_STRINGS[key]
			assert(_major_arpeggios.exercises.has(key), "Expected major arpeggios RH to contain key %s" % [key_str])
