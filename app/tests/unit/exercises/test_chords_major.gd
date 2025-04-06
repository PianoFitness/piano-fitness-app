extends GutTest

class TestChordsMajor:
	extends GutTest
	var ChordsMajor = load("res://scripts/exercises/chords_major.gd")
	var MusicalConstants = load("res://scripts/constants/musical_constants.gd")
	var _chords_major = null

	func before_each():
		_chords_major = ChordsMajor.new()

	func test_chords_major_contains_practice_keys():
		var practice_keys = MusicalConstants.get_practice_keys()
		for key in practice_keys:
			var key_str = MusicalConstants.MUSIC_KEY_STRINGS[key]
			assert(_chords_major.exercises.has(key), "Expected major chords to contain key %s" % [key_str])
