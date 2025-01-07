class_name PracticeSequence
extends Resource

# Define a custom Array property that will store arrays of PianoNote arrays
@export var sequence: Array[Array] = []
@export var exercise_type: String = ""

func add_position(notes: Array[PianoNote]):
	sequence.append(notes)

func clear():
	sequence.clear()
	exercise_type = ""
