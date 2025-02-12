extends GutTest

class TestArpeggiosDiminished:
	extends GutTest
	var DiminishedArpeggioExercises = load("res://scripts/exercises/arpeggios_diminished.gd")
	var MusicalConstants = load("res://scripts/autoload/musical_constants.gd")
	var _diminished_arpeggios = null

	func before_each():
		_diminished_arpeggios = DiminishedArpeggioExercises.new()

	func test_diminished_arpeggios_contains_practice_keys():
		var practice_keys = MusicalConstants.get_practice_keys()
		for key in practice_keys:
			var key_str = MusicalConstants.MUSIC_KEY_STRINGS[key]
			assert(_diminished_arpeggios.exercises.has(key), "Expected diminished arpeggios to contain key %s" % [key_str])
