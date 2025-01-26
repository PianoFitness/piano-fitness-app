class_name PracticeSequence
extends Resource

enum ExerciseType {
	SCALES,
	CHORDS,
	ARPEGGIOS
}

@export var sequence: Array[Array] = []
@export var exercise_type: ExerciseType = ExerciseType.SCALES

func add_position(notes: Array[PianoNote]):
	sequence.append(notes)

func clear():
	sequence.clear()
	exercise_type = ExerciseType.SCALES
