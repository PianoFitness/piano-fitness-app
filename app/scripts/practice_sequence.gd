class_name PracticeSequence
extends Resource

enum ExerciseType {
	SCALES,
	CHORDS,
	MAJOR_ARPEGGIOS,
	MINOR_ARPEGGIOS,
}

var sequence: Array[NotePosition] = []
var exercise_type: ExerciseType = ExerciseType.SCALES

func add_position(position: NotePosition):
	sequence.append(position)

func clear():
	sequence.clear()
	exercise_type = ExerciseType.SCALES
