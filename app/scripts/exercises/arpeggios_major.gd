class_name ArpeggioExercises extends Resource
# Right hand ascending arpeggios with correct fingerings for all major triads

var c_major_rh_arpeggios = [
	["C4", 1], # Thumb
	["E4", 2], # Index
	["G4", 3], # Middle
	["C5", 5] # Pinky
]

var g_major_rh_arpeggios = [
	["G4", 1], # Thumb
	["B4", 2], # Index
	["D5", 3], # Middle
	["G5", 5] # Pinky
]

var d_major_rh_arpeggios = [
	["D4", 1], # Thumb
	["F#4", 2], # Index
	["A4", 3], # Middle
	["D5", 5] # Pinky
]

var a_major_rh_arpeggios = [
	["A4", 1], # Thumb
	["C#5", 2], # Index
	["E5", 3], # Middle
	["A5", 5] # Pinky
]

var e_major_rh_arpeggios = [
	["E4", 1], # Thumb
	["G#4", 2], # Index
	["B4", 3], # Middle
	["E5", 5] # Pinky
]

var b_major_rh_arpeggios = [
	["B4", 1], # Thumb
	["D#5", 2], # Index
	["F#5", 3], # Middle
	["B5", 5] # Pinky
]

var f_sharp_major_rh_arpeggios = [
	["F#4", 1], # Thumb
	["A#4", 2], # Index
	["C#5", 3], # Middle
	["F#5", 5] # Pinky
]

var c_sharp_major_rh_arpeggios = [
	["C#4", 1], # Thumb
	["E#4", 2], # Index
	["G#4", 3], # Middle
	["C#5", 5] # Pinky
]

var f_major_rh_arpeggios = [
	["F4", 1], # Thumb
	["A4", 2], # Index
	["C5", 3], # Middle
	["F5", 5] # Pinky
]

var b_flat_major_rh_arpeggios = [
	["Bb4", 1], # Thumb
	["D5", 2], # Index
	["F5", 3], # Middle
	["Bb5", 5] # Pinky
]

var e_flat_major_rh_arpeggios = [
	["Eb4", 1], # Thumb
	["G4", 2], # Index
	["Bb4", 3], # Middle
	["Eb5", 5] # Pinky
]

var a_flat_major_rh_arpeggios = [
	["Ab4", 1], # Thumb
	["C5", 2], # Index
	["Eb5", 3], # Middle
	["Ab5", 5] # Pinky
]

# Left hand ascending arpeggios with correct fingerings for all major triads

var c_major_lh_arpeggios = [
	["C3", 5], # Pinky
	["E3", 3], # Middle
	["G3", 2], # Index
	["C4", 1] # Thumb
]

var g_major_lh_arpeggios = [
	["G3", 5], # Pinky
	["B3", 3], # Middle
	["D4", 2], # Index
	["G4", 1] # Thumb
]

var d_major_lh_arpeggios = [
	["D3", 5], # Pinky
	["F#3", 3], # Middle
	["A3", 2], # Index
	["D4", 1] # Thumb
]

var a_major_lh_arpeggios = [
	["A3", 5], # Pinky
	["C#4", 3], # Middle
	["E4", 2], # Index
	["A4", 1] # Thumb
]

var e_major_lh_arpeggios = [
	["E3", 5], # Pinky
	["G#3", 3], # Middle
	["B3", 2], # Index
	["E4", 1] # Thumb
]

var b_major_lh_arpeggios = [
	["B2", 5], # Pinky
	["D#3", 3], # Middle
	["F#3", 2], # Index
	["B3", 1] # Thumb
]

var f_sharp_major_lh_arpeggios = [
	["F#3", 5], # Pinky
	["A#3", 3], # Middle
	["C#4", 2], # Index
	["F#4", 1] # Thumb
]

var c_sharp_major_lh_arpeggios = [
	["C#3", 5], # Pinky
	["E#3", 3], # Middle
	["G#3", 2], # Index
	["C#4", 1] # Thumb
]

var f_major_lh_arpeggios = [
	["F3", 5], # Pinky
	["A3", 3], # Middle
	["C4", 2], # Index
	["F4", 1] # Thumb
]

var b_flat_major_lh_arpeggios = [
	["Bb2", 5], # Pinky
	["D3", 3], # Middle
	["F3", 2], # Index
	["Bb3", 1] # Thumb
]

var e_flat_major_lh_arpeggios = [
	["Eb3", 5], # Pinky
	["G3", 3], # Middle
	["Bb3", 2], # Index
	["Eb4", 1] # Thumb
]

var a_flat_major_lh_arpeggios = [
	["Ab3", 5], # Pinky
	["C4", 3], # Middle
	["Eb4", 2], # Index
	["Ab4", 1] # Thumb
]

var exercises = {
	"C": {
		"right_hand": c_major_rh_arpeggios,
		"left_hand": c_major_lh_arpeggios
	},
	"G": {
		"right_hand": g_major_rh_arpeggios,
		"left_hand": g_major_lh_arpeggios
	},
	"D": {
		"right_hand": d_major_rh_arpeggios,
		"left_hand": d_major_lh_arpeggios
	},
	"A": {
		"right_hand": a_major_rh_arpeggios,
		"left_hand": a_major_lh_arpeggios
	},
	"E": {
		"right_hand": e_major_rh_arpeggios,
		"left_hand": e_major_lh_arpeggios
	},
	"B": {
		"right_hand": b_major_rh_arpeggios,
		"left_hand": b_major_lh_arpeggios
	},
	"F#": {
		"right_hand": f_sharp_major_rh_arpeggios,
		"left_hand": f_sharp_major_lh_arpeggios
	},
	"C#": {
		"right_hand": c_sharp_major_rh_arpeggios,
		"left_hand": c_sharp_major_lh_arpeggios
	},
	"F": {
		"right_hand": f_major_rh_arpeggios,
		"left_hand": f_major_lh_arpeggios
	},
	"Bb": {
		"right_hand": b_flat_major_rh_arpeggios,
		"left_hand": b_flat_major_lh_arpeggios
	},
	"Eb": {
		"right_hand": e_flat_major_rh_arpeggios,
		"left_hand": e_flat_major_lh_arpeggios
	},
	"Ab": {
		"right_hand": a_flat_major_rh_arpeggios,
		"left_hand": a_flat_major_lh_arpeggios
	}
}

func get_exercise(key: String, hand: String) -> Array:
	return exercises[key][hand]

func has_exercise(key: String, hand: String) -> bool:
	return exercises.has(key) and exercises[key].has(hand)