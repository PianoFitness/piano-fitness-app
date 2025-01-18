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
