extends Control

# Signals
signal clear_highlighted_keys

# Node references
@onready var exercise_type_dropdown = $HBoxContainer/ExerciseTypeDropdown
@onready var key_dropdown = $HBoxContainer/KeyDropdown
@onready var sequence_manager = get_parent().get_node("SequenceManager")

# Load exercises
@onready var scales = load("res://scripts/exercises/scales_major.gd").new()

# Key to scale mapping
@onready var key_to_scale = {
	"C": scales.c_major_rh_1oct,
	"G": scales.g_major_rh_1oct,
	"D": scales.d_major_rh_1oct,
	"A": scales.a_major_rh_1oct,
	"E": scales.e_major_rh_1oct,
	"B": scales.b_major_rh_1oct,
	"F#": scales.f_sharp_major_rh_1oct,
	"C#": scales.c_sharp_major_rh_1oct,
	"F": scales.f_major_rh_1oct,
	"Bb": scales.b_flat_major_rh_1oct,
	"Eb": scales.e_flat_major_rh_1oct,
	"Ab": scales.a_flat_major_rh_1oct
}

func _ready():
	exercise_type_dropdown.connect("item_selected", _on_exercise_type_selected)
	key_dropdown.connect("item_selected", _on_key_selected)
	_initialize_dropdowns()
	call_deferred("_update_exercise")

func _initialize_dropdowns():
	exercise_type_dropdown.clear()
	exercise_type_dropdown.add_item("Scales")
	exercise_type_dropdown.add_item("Chords")
	exercise_type_dropdown.add_item("Arpeggios")
	
	_update_key_dropdown()

func _update_key_dropdown():
	key_dropdown.clear()
	if exercise_type_dropdown.get_item_text(exercise_type_dropdown.selected) == "Scales":
		var keys = ["C", "G", "D", "A", "E", "B", "F#", "C#", "F", "Bb", "Eb", "Ab"]
		for key in keys:
			key_dropdown.add_item(key)
	else:
		key_dropdown.add_item("C")

func _on_exercise_type_selected(index):
	_update_key_dropdown()
	_update_exercise()

func _on_key_selected(index):
	_update_exercise()

func _update_exercise():
	emit_signal("clear_highlighted_keys")
	
	var exercise_type = exercise_type_dropdown.get_item_text(exercise_type_dropdown.selected)
	var key = key_dropdown.get_item_text(key_dropdown.selected)
	print(exercise_type, key)
	var exercises = {
		"Scales": "create_scale",
		"Chords": "create_c_major_chord_inversions",
		"Arpeggios": "create_c_major_arpeggios"
	}
	
	if exercises.has(exercise_type):
		var exercise_method = exercises[exercise_type]
		var exercise_sequence = self.call(exercise_method, key)
		sequence_manager.set_sequence(exercise_sequence)

# Exercise creation methods
func create_scale(key: String) -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "scale"

	var scale_notes = key_to_scale[key]
	
	for note_data in scale_notes:
		var note = PianoNote.new(note_data[0], "R", note_data[1])
		sequence.add_position([note])
	
	return sequence

func create_c_major_chord_inversions() -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "chord_inversions"
	
	# Root position: C4(1) - E4(3) - G4(5)
	sequence.add_position([
		PianoNote.new("C4", "R", 1), # Root - thumb
		PianoNote.new("E4", "R", 3), # Third - middle finger
		PianoNote.new("G4", "R", 5) # Fifth - pinky
	])
	
	# First inversion: E4(1) - G4(2) - C5(5)
	sequence.add_position([
		PianoNote.new("E4", "R", 1), # Third - thumb
		PianoNote.new("G4", "R", 2), # Fifth - index finger
		PianoNote.new("C5", "R", 5) # Root - pinky
	])
	
	# Second inversion: G4(1) - C5(3) - E5(5)
	sequence.add_position([
		PianoNote.new("G4", "R", 1), # Fifth - thumb
		PianoNote.new("C5", "R", 3), # Root - middle finger
		PianoNote.new("E5", "R", 5) # Third - pinky
	])
	
	# Root position octave up: C5(1) - E5(3) - G5(5)
	sequence.add_position([
		PianoNote.new("C5", "R", 1), # Root - thumb
		PianoNote.new("E5", "R", 3), # Third - middle finger
		PianoNote.new("G5", "R", 5) # Fifth - pinky
	])
	
	return sequence

func create_c_major_arpeggios() -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "arpeggio"
	
	# Right hand ascending C Major arpeggio in one octave
	var arpeggio_notes = [
		["C4", 1], # Thumb
		["E4", 2], # Index
		["G4", 3], # Middle
		["C5", 5] # Pinky
	]
	
	for note_data in arpeggio_notes:
		var note = PianoNote.new(note_data[0], "R", note_data[1])
		sequence.add_position([note])
	
	return sequence
