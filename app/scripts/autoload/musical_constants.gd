extends Node

const NOTE_TO_MIDI_OFFSET = {
	"C": 0, "C#": 1, "Db": 1,
	"D": 2, "D#": 3, "Eb": 3,
	"E": 4, "Fb": 4, "E#": 5,
	"F": 5, "F#": 6, "Gb": 6,
	"G": 7, "G#": 8, "Ab": 8,
	"A": 9, "A#": 10, "Bb": 10,
	"B": 11, "Cb": 11, "B#": 0
}

const MIDI_TO_NOTE_PREFERRED = {
	0: "C", 1: "C#", 2: "D", 3: "Eb",
	4: "E", 5: "F", 6: "F#", 7: "G",
	8: "Ab", 9: "A", 10: "Bb", 11: "B"
}

const KEYS_PER_OCTAVE = 12
const STARTING_MIDI_NOTE = 24 # Starting at C1

enum MusicKey {
	C, # No accidentals
	G, # 1 sharp
	D, # 2 sharps
	A, # 3 sharps
	E, # 4 sharps
	B, # 5 sharps
	F_SHARP, # 6 sharps
	C_SHARP, # 7 sharps
	G_SHARP, # 8 sharps
	F, # 1 flat
	B_FLAT, # 2 flats
	E_FLAT, # 3 flats
	A_FLAT, # 4 flats
	D_FLAT, # 5 flats
	G_FLAT, # 6 flats
	C_FLAT, # 7 flats
}

const MUSIC_KEY_STRINGS = {
	MusicKey.C: "C",
	MusicKey.G: "G",
	MusicKey.D: "D",
	MusicKey.A: "A",
	MusicKey.E: "E",
	MusicKey.B: "B",
	MusicKey.F_SHARP: "F#",
	MusicKey.C_SHARP: "C#",
	MusicKey.G_SHARP: "G#",
	MusicKey.F: "F",
	MusicKey.B_FLAT: "Bb",
	MusicKey.E_FLAT: "Eb",
	MusicKey.A_FLAT: "Ab",
	MusicKey.D_FLAT: "Db",
	MusicKey.G_FLAT: "Gb",
	MusicKey.C_FLAT: "Cb"
}

## Returns an array of musical keys for practice, excluding keys that require double accidentals.
## Practice keys are those with 7 or fewer accidentals in their key signatures.
## Returns:
##   Array[int]: An array of MusicKey enum values representing the practice keys
static func get_practice_keys():
	var keys = []

	for key_value in range(MusicKey.size()):
		if key_value == MusicKey.G_SHARP:
			continue # Skip G# as it requires double accidentals
		keys.append(key_value)
	return keys