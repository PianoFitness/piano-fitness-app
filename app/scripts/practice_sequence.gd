extends Resource

const NotePosition = preload("res://scripts/models/note_position.gd")

enum ExerciseType {
	SCALES,
	CHORDS,
	MAJOR_ARPEGGIOS,
	MINOR_ARPEGGIOS,
	DIMINISHED_ARPEGGIOS,
	DIATONIC_ARPEGGIOS,
	MAJOR_ARPEGGIOS_2_OCTAVE,
}

var sequence: Array[NotePosition] = []
var exercise_type: ExerciseType = ExerciseType.SCALES

func add_position(position: NotePosition):
	sequence.append(position)

func clear():
	sequence.clear()
	exercise_type = ExerciseType.SCALES
