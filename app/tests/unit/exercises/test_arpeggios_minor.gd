extends GutTest

class TestArpeggiosMinor:
	extends GutTest
	var MinorArpeggios = load("res://scripts/exercises/arpeggios_minor.gd")
	var MusicalConstants = load("res://scripts/autoload/musical_constants.gd")
	var _minor_arpeggios = null

	func before_each():
		_minor_arpeggios = MinorArpeggios.new()

	func test_minor_arpeggios_contains_practice_keys():
		var practice_keys = MusicalConstants.get_practice_keys()
		for key in practice_keys:
			var key_str = MusicalConstants.MUSIC_KEY_STRINGS[key]
			assert(_minor_arpeggios.exercises.has(key), "Expected minor arpeggios to contain key %s" % [key_str])
