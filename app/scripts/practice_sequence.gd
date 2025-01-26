class_name PracticeSequence
extends Resource

const FingeredNote = preload("res://scripts/models/fingered_note.gd")
const NotePosition = preload("res://scripts/models/note_position.gd")

enum ExerciseType {
	SCALES,
	CHORDS,
	ARPEGGIOS
}

var sequence: Array[NotePosition] = []
var exercise_type: ExerciseType = ExerciseType.SCALES

func add_position(position: NotePosition):
	sequence.append(position)

func clear():
	sequence.clear()
	exercise_type = ExerciseType.SCALES
