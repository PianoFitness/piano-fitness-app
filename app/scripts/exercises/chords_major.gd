class_name ChordExercises extends Resource

const Hand = preload("res://scripts/constants/hand.gd").Hand

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

var c_major_lh_inversions = [
    # Root position: C3(5) - E3(3) - G3(1)
    [
        ["C3", 5], # Root - pinky
        ["E3", 3], # Third - middle
        ["G3", 1] # Fifth - thumb
    ],
    # First inversion: E3(5) - G3(2) - C4(1)
    [
        ["E3", 5], # Third - pinky
        ["G3", 2], # Fifth - index
        ["C4", 1] # Root - thumb
    ],
    # Second inversion: G3(5) - C4(3) - E4(1)
    [
        ["G3", 5], # Fifth - pinky
        ["C4", 3], # Root - middle
        ["E4", 1] # Third - thumb
    ]
]

var f_major_lh_inversions = [
    # Root position
    [
        ["F3", 5],
        ["A3", 3],
        ["C4", 1]
    ],
    # First inversion
    [
        ["A3", 5],
        ["C4", 2],
        ["F4", 1]
    ],
    # Second inversion
    [
        ["C3", 5],
        ["F3", 3],
        ["A3", 1]
    ]
]

var b_flat_major_lh_inversions = [
    # Root position
    [
        ["Bb2", 5],
        ["D3", 3],
        ["F3", 1]
    ],
    # First inversion
    [
        ["D3", 5],
        ["F3", 2],
        ["Bb3", 1]
    ],
    # Second inversion
    [
        ["F3", 5],
        ["Bb3", 3],
        ["D4", 1]
    ]
]

var e_flat_major_lh_inversions = [
    # Root position
    [
        ["Eb3", 5],
        ["G3", 3],
        ["Bb3", 1]
    ],
    # First inversion
    [
        ["G3", 5],
        ["Bb3", 2],
        ["Eb4", 1]
    ],
    # Second inversion
    [
        ["Bb3", 5],
        ["Eb4", 3],
        ["G4", 1]
    ]
]

var a_flat_major_lh_inversions = [
    # Root position
    [
        ["Ab3", 5],
        ["C4", 3],
        ["Eb4", 1]
    ],
    # First inversion
    [
        ["C4", 5],
        ["Eb4", 2],
        ["Ab4", 1]
    ],
    # Second inversion
    [
        ["Eb3", 5],
        ["Ab3", 3],
        ["C4", 1]
    ]
]

var g_major_lh_inversions = [
    # Root position
    [
        ["G3", 5],
        ["B3", 3],
        ["D4", 1]
    ],
    # First inversion
    [
        ["B3", 5],
        ["D4", 2],
        ["G4", 1]
    ],
    # Second inversion
    [
        ["D3", 5],
        ["G3", 3],
        ["B3", 1]
    ]
]

var d_major_lh_inversions = [
    # Root position
    [
        ["D3", 5],
        ["F#3", 3],
        ["A3", 1]
    ],
    # First inversion
    [
        ["F#3", 5],
        ["A3", 2],
        ["D4", 1]
    ],
    # Second inversion
    [
        ["A3", 5],
        ["D4", 3],
        ["F#4", 1]
    ]
]

var a_major_lh_inversions = [
    # Root position
    [
        ["A3", 5],
        ["C#4", 3],
        ["E4", 1]
    ],
    # First inversion
    [
        ["C#4", 5],
        ["E4", 2],
        ["A4", 1]
    ],
    # Second inversion
    [
        ["E3", 5],
        ["A3", 3],
        ["C#4", 1]
    ]
]

var e_major_lh_inversions = [
    # Root position
    [
        ["E3", 5],
        ["G#3", 3],
        ["B3", 1]
    ],
    # First inversion
    [
        ["G#3", 5],
        ["B3", 2],
        ["E4", 1]
    ],
    # Second inversion
    [
        ["B3", 5],
        ["E4", 3],
        ["G#4", 1]
    ]
]

var b_major_lh_inversions = [
    # Root position
    [
        ["B2", 5],
        ["D#3", 3],
        ["F#3", 1]
    ],
    # First inversion
    [
        ["D#3", 5],
        ["F#3", 2],
        ["B3", 1]
    ],
    # Second inversion
    [
        ["F#3", 5],
        ["B3", 3],
        ["D#4", 1]
    ]
]

var f_sharp_major_lh_inversions = [
    # Root position
    [
        ["F#3", 5],
        ["A#3", 3],
        ["C#4", 1]
    ],
    # First inversion
    [
        ["A#3", 5],
        ["C#4", 2],
        ["F#4", 1]
    ],
    # Second inversion
    [
        ["C#3", 5],
        ["F#3", 3],
        ["A#3", 1]
    ]
]

var c_sharp_major_lh_inversions = [
    # Root position
    [
        ["C#3", 5],
        ["E#3", 3],
        ["G#3", 1]
    ],
    # First inversion
    [
        ["E#3", 5],
        ["G#3", 2],
        ["C#4", 1]
    ],
    # Second inversion
    [
        ["G#3", 5],
        ["C#4", 3],
        ["E#4", 1]
    ]
]

var exercises = {
	MusicalConstants.MusicKey.C: {
		Hand.RIGHT_HAND: c_major_rh_inversions,
		Hand.LEFT_HAND: c_major_lh_inversions
	},
	MusicalConstants.MusicKey.G: {
		Hand.RIGHT_HAND: g_major_rh_inversions,
		Hand.LEFT_HAND: g_major_lh_inversions
	},
	MusicalConstants.MusicKey.D: {
		Hand.RIGHT_HAND: d_major_rh_inversions,
		Hand.LEFT_HAND: d_major_lh_inversions
	},
	MusicalConstants.MusicKey.A: {
		Hand.RIGHT_HAND: a_major_rh_inversions,
		Hand.LEFT_HAND: a_major_lh_inversions
	},
	MusicalConstants.MusicKey.E: {
		Hand.RIGHT_HAND: e_major_rh_inversions,
		Hand.LEFT_HAND: e_major_lh_inversions
	},
	MusicalConstants.MusicKey.B: {
		Hand.RIGHT_HAND: b_major_rh_inversions,
		Hand.LEFT_HAND: b_major_lh_inversions
	},
	MusicalConstants.MusicKey.F_SHARP: {
		Hand.RIGHT_HAND: f_sharp_major_rh_inversions,
		Hand.LEFT_HAND: f_sharp_major_lh_inversions
	},
	MusicalConstants.MusicKey.C_SHARP: {
		Hand.RIGHT_HAND: c_sharp_major_rh_inversions,
		Hand.LEFT_HAND: c_sharp_major_lh_inversions
	},
	MusicalConstants.MusicKey.F: {
		Hand.RIGHT_HAND: f_major_rh_inversions,
		Hand.LEFT_HAND: f_major_lh_inversions
	},
	MusicalConstants.MusicKey.B_FLAT: {
		Hand.RIGHT_HAND: b_flat_major_rh_inversions,
		Hand.LEFT_HAND: b_flat_major_lh_inversions
	},
	MusicalConstants.MusicKey.E_FLAT: {
		Hand.RIGHT_HAND: e_flat_major_rh_inversions,
		Hand.LEFT_HAND: e_flat_major_lh_inversions
	},
	MusicalConstants.MusicKey.A_FLAT: {
		Hand.RIGHT_HAND: a_flat_major_rh_inversions,
		Hand.LEFT_HAND: a_flat_major_lh_inversions
	}
}

func get_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> Array:
	return exercises[key][hand]

func has_exercise(key: MusicalConstants.MusicKey, hand: Hand) -> bool:
	return exercises.has(key) and exercises[key].has(hand)
