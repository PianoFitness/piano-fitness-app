extends Control

# Node references
@onready var exercise_type_dropdown = $HBoxContainer/ExerciseTypeDropdown
@onready var key_dropdown = $HBoxContainer/KeyDropdown
@onready var sequence_manager = get_parent().get_node("SequenceManager")

func _ready():
	exercise_type_dropdown.connect("item_selected", _on_exercise_type_selected)
	key_dropdown.connect("item_selected", _on_key_selected)
	_initialize_dropdowns()

func _initialize_dropdowns():
	exercise_type_dropdown.clear()
	exercise_type_dropdown.add_item("Scales")
	exercise_type_dropdown.add_item("Chords")
	exercise_type_dropdown.add_item("Arpeggios")
	
	key_dropdown.clear()
	key_dropdown.add_item("C")

func _on_exercise_type_selected(index):
	_update_exercise()

func _on_key_selected(index):
	_update_exercise()

func _update_exercise():
	var exercise_type = exercise_type_dropdown.get_item_text(exercise_type_dropdown.selected)
	var key = key_dropdown.get_item_text(key_dropdown.selected)
	
	var exercises = {
		"Scales": "create_c_major_scale",
		"Chords": "create_c_major_chord_inversions",
		"Arpeggios": "create_c_major_arpeggios"
	}
	
	if exercises.has(exercise_type):
		var exercise_method = exercises[exercise_type]
		var exercise_sequence = get_parent().call(exercise_method)
		sequence_manager.set_sequence(exercise_sequence)
