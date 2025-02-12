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
	D_SHARP, # 9 sharps
	A_SHARP, # 10 sharps
	E_SHARP, # 11 sharps
	B_SHARP, # 12 sharps
	F, # 1 flat
	B_FLAT, # 2 flats
	E_FLAT, # 3 flats
	A_FLAT, # 4 flats
	D_FLAT, # 5 flats
	G_FLAT, # 6 flats
	C_FLAT, # 7 flats
	F_FLAT # 8 flats
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
	MusicKey.D_SHARP: "D#",
	MusicKey.A_SHARP: "A#",
	MusicKey.E_SHARP: "E#",
	MusicKey.B_SHARP: "B#",
	MusicKey.F: "F",
	MusicKey.B_FLAT: "Bb",
	MusicKey.E_FLAT: "Eb",
	MusicKey.A_FLAT: "Ab",
	MusicKey.D_FLAT: "Db",
	MusicKey.G_FLAT: "Gb",
	MusicKey.C_FLAT: "Cb",
	MusicKey.F_FLAT: "Fb",
}

const EXCLUDED_PRACTICE_KEYS = [
    MusicKey.G_SHARP, # 8 sharps (theoretical key, enharmonic with A♭)
    MusicKey.D_SHARP, # 9 sharps (theoretical key, enharmonic with E♭)
    MusicKey.A_SHARP, # 10 sharps (theoretical key, enharmonic with B♭)
    MusicKey.E_SHARP, # 11 sharps (theoretical key, enharmonic with F)
    MusicKey.B_SHARP, # 12 sharps (theoretical key, enharmonic with C)
	MusicKey.G_FLAT, # 6 flats (enharmonic with F♯, prefer F♯ in practice)
    MusicKey.C_FLAT, # 7 flats (theoretical key, enharmonic with B)
	MusicKey.F_FLAT # 8 flats (theoretical key, enharmonic with E)
]

## Returns an array of musical keys suitable for practice and teaching.
## Excludes impractical keys that:
## - Require double accidentals (more than 7 sharps)
## - Have enharmonic equivalents that are more commonly used
## - Would be confusing for students learning music theory
## Returns:
##   Array[MusicKey]: Practical keys ordered by complexity (following circle of fifths)
static func get_practice_keys() -> Array[MusicKey]:
    # Create a list of all possible key values
    var all_keys: Array[MusicKey] = []
    for key_value in range(MusicKey.size()):
        all_keys.append(key_value)
    
    # Filter out excluded keys using the predefined constant
    var practice_keys: Array[MusicKey] = all_keys.filter(
        func(key): return not (key in EXCLUDED_PRACTICE_KEYS)
    )
    
    return practice_keys