# Right hand ascending chord inversions with correct fingerings

var c_major_rh_inversions = [
	# Root position: C4(1) - E4(3) - G4(5)
	[
		["C4", 1], # Root - thumb
		["E4", 3], # Third - middle finger
		["G4", 5] # Fifth - pinky
	],
	# First inversion: E4(1) - G4(2) - C5(5)
	[
		["E4", 1], # Third - thumb
		["G4", 2], # Fifth - index finger
		["C5", 5] # Root - pinky
	],
	# Second inversion: G4(1) - C5(3) - E5(5)
	[
		["G4", 1], # Fifth - thumb
		["C5", 3], # Root - middle finger
		["E5", 5] # Third - pinky
	]
]

var g_major_rh_inversions = [
	# Root position: G4(1) - B4(3) - D5(5)
	[
		["G4", 1], # Root - thumb
		["B4", 3], # Third - middle finger
		["D5", 5] # Fifth - pinky
	],
	# First inversion: B4(1) - D5(2) - G5(5)
	[
		["B4", 1], # Third - thumb
		["D5", 2], # Fifth - index finger
		["G5", 5] # Root - pinky
	],
	# Second inversion: D4(1) - G4(3) - B4(5)
	[
		["D4", 1], # Fifth - thumb
		["G4", 3], # Root - middle finger
		["B4", 5] # Third - pinky
	]
]

var d_major_rh_inversions = [
	# Root position: D4(1) - F#4(3) - A4(5)
	[
		["D4", 1], # Root - thumb
		["F#4", 3], # Third - middle finger
		["A4", 5] # Fifth - pinky
	],
	# First inversion: F#4(1) - A4(2) - D5(5)
	[
		["F#4", 1], # Third - thumb
		["A4", 2], # Fifth - index finger
		["D5", 5] # Root - pinky
	],
	# Second inversion: A4(1) - D5(3) - F#5(5)
	[
		["A4", 1], # Fifth - thumb
		["D5", 3], # Root - middle finger
		["F#5", 5] # Third - pinky
	]
]

var a_major_rh_inversions = [
	# Root position: A4(1) - C#5(3) - E5(5)
	[
		["A4", 1], # Root - thumb
		["C#5", 3], # Third - middle finger
		["E5", 5] # Fifth - pinky
	],
	# First inversion: C#5(1) - E5(2) - A5(5)
	[
		["C#5", 1], # Third - thumb
		["E5", 2], # Fifth - index finger
		["A5", 5] # Root - pinky
	],
	# Second inversion: E4(1) - A4(3) - C#5(5)
	[
		["E4", 1], # Fifth - thumb
		["A4", 3], # Root - middle finger
		["C#5", 5] # Third - pinky
	]
]

var e_major_rh_inversions = [
	# Root position: E4(1) - G#4(3) - B4(5)
	[
		["E4", 1], # Root - thumb
		["G#4", 3], # Third - middle finger
		["B4", 5] # Fifth - pinky
	],
	# First inversion: G#4(1) - B4(2) - E5(5)
	[
		["G#4", 1], # Third - thumb
		["B4", 2], # Fifth - index finger
		["E5", 5] # Root - pinky
	],
	# Second inversion: B4(1) - E5(3) - G#5(5)
	[
		["B4", 1], # Fifth - thumb
		["E5", 3], # Root - middle finger
		["G#5", 5] # Third - pinky
	]
]

var b_major_rh_inversions = [
	# Root position: B4(1) - D#5(3) - F#5(5)
	[
		["B4", 1], # Root - thumb
		["D#5", 3], # Third - middle finger
		["F#5", 5] # Fifth - pinky
	],
	# First inversion: D#5(1) - F#5(2) - B5(5)
	[
		["D#5", 1], # Third - thumb
		["F#5", 2], # Fifth - index finger
		["B5", 5] # Root - pinky
	],
	# Second inversion: F#4(1) - B4(3) - D#5(5)
	[
		["F#4", 1], # Fifth - thumb
		["B4", 3], # Root - middle finger
		["D#5", 5] # Third - pinky
	]
]

var f_sharp_major_rh_inversions = [
	# Root position: F#4(1) - A#4(3) - C#5(5)
	[
		["F#4", 1], # Root - thumb
		["A#4", 3], # Third - middle finger
		["C#5", 5] # Fifth - pinky
	],
	# First inversion: A#4(1) - C#5(2) - F#5(5)
	[
		["A#4", 1], # Third - thumb
		["C#5", 2], # Fifth - index finger
		["F#5", 5] # Root - pinky
	],
	# Second inversion: C#4(1) - F#4(3) - A#4(5)
	[
		["C#4", 1], # Fifth - thumb
		["F#4", 3], # Root - middle finger
		["A#4", 5] # Third - pinky
	]
]

var c_sharp_major_rh_inversions = [
	# Root position: C#4(1) - E#4(3) - G#4(5)
	[
		["C#4", 1], # Root - thumb
		["E#4", 3], # Third - middle finger
		["G#4", 5] # Fifth - pinky
	],
	# First inversion: E#4(1) - G#4(2) - C#5(5)
	[
		["E#4", 1], # Third - thumb
		["G#4", 2], # Fifth - index finger
		["C#5", 5] # Root - pinky
	],
	# Second inversion: G#4(1) - C#5(3) - E#5(5)
	[
		["G#4", 1], # Fifth - thumb
		["C#5", 3], # Root - middle finger
		["E#5", 5] # Third - pinky
	]
]

var f_major_rh_inversions = [
	# Root position: F4(1) - A4(3) - C5(5)
	[
		["F4", 1], # Root - thumb
		["A4", 3], # Third - middle finger
		["C5", 5] # Fifth - pinky
	],
	# First inversion: A4(1) - C5(2) - F5(5)
	[
		["A4", 1], # Third - thumb
		["C5", 2], # Fifth - index finger
		["F5", 5] # Root - pinky
	],
	# Second inversion: C4(1) - F4(3) - A4(5)
	[
		["C4", 1], # Fifth - thumb
		["F4", 3], # Root - middle finger
		["A4", 5] # Third - pinky
	]
]

var b_flat_major_rh_inversions = [
	# Root position: Bb4(1) - D5(3) - F5(5)
	[
		["Bb4", 1], # Root - thumb
		["D5", 3], # Third - middle finger
		["F5", 5] # Fifth - pinky
	],
	# First inversion: D5(1) - F5(2) - Bb5(5)
	[
		["D5", 1], # Third - thumb
		["F5", 2], # Fifth - index finger
		["Bb5", 5] # Root - pinky
	],
	# Second inversion: F4(1) - Bb4(3) - D5(5)
	[
		["F4", 1], # Fifth - thumb
		["Bb4", 3], # Root - middle finger
		["D5", 5] # Third - pinky
	]
]

var e_flat_major_rh_inversions = [
	# Root position: Eb4(1) - G4(3) - Bb4(5)
	[
		["Eb4", 1], # Root - thumb
		["G4", 3], # Third - middle finger
		["Bb4", 5] # Fifth - pinky
	],
	# First inversion: G4(1) - Bb4(2) - Eb5(5)
	[
		["G4", 1], # Third - thumb
		["Bb4", 2], # Fifth - index finger
		["Eb5", 5] # Root - pinky
	],
	# Second inversion: Bb4(1) - Eb5(3) - G5(5)
	[
		["Bb4", 1], # Fifth - thumb
		["Eb5", 3], # Root - middle finger
		["G5", 5] # Third - pinky
	]
]

var a_flat_major_rh_inversions = [
	# Root position: Ab4(1) - C5(3) - Eb5(5)
	[
		["Ab4", 1], # Root - thumb
		["C5", 3], # Third - middle finger
		["Eb5", 5] # Fifth - pinky
	],
	# First inversion: C5(1) - Eb5(2) - Ab5(5)
	[
		["C5", 1], # Third - thumb
		["Eb5", 2], # Fifth - index finger
		["Ab5", 5] # Root - pinky
	],
	# Second inversion: Eb4(1) - Ab4(3) - C5(5)
	[
		["Eb4", 1], # Fifth - thumb
		["Ab4", 3], # Root - middle finger
		["C5", 5] # Third - pinky
	]
]