extends Control

# Signals
signal clear_highlighted_keys

# Node references
@onready var exercise_type_dropdown = $HBoxContainer/ExerciseTypeDropdown
@onready var key_dropdown = $HBoxContainer/KeyDropdown
@onready var sequence_manager = get_parent().get_node("SequenceManager")

# Load exercises
@onready var scales = load("res://scripts/exercises/scales_major.gd").new()
@onready var chords = load("res://scripts/exercises/chords_major.gd").new()
@onready var arpeggios = load("res://scripts/exercises/arpeggios_major.gd").new()

# Named entity for exercise map
class ExerciseMap:
	var scales: Array
	var chords: Array
	var arpeggios: Array
	
	func _init(_scales: Array, _chords: Array, _arpeggios: Array):
		scales = _scales
		chords = _chords
		arpeggios = _arpeggios

# Helper method to create exercise maps
func create_exercise_map(key: String) -> ExerciseMap:
	return ExerciseMap.new(
		scales.get(key.to_snake_case() + "_major_rh_1oct"),
		chords.get(key.to_snake_case() + "_major_rh_inversions"),
		arpeggios.get(key.to_snake_case() + "_major_rh_arpeggios")
	)

# Key to exercise mapping
@onready var key_to_exercises = {
	"C": create_exercise_map("c"),
	"G": create_exercise_map("g"),
	"D": create_exercise_map("d"),
	"A": create_exercise_map("a"),
	"E": create_exercise_map("e"),
	"B": create_exercise_map("b"),
	"F#": create_exercise_map("f_sharp"),
	"C#": create_exercise_map("c_sharp"),
	"F": create_exercise_map("f"),
	"Bb": create_exercise_map("b_flat"),
	"Eb": create_exercise_map("e_flat"),
	"Ab": create_exercise_map("a_flat")
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
	var keys = ["C", "G", "D", "A", "E", "B", "F#", "C#", "F", "Bb", "Eb", "Ab"]
	for key in keys:
		key_dropdown.add_item(key)

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
		"Chords": "create_chord_inversions",
		"Arpeggios": "create_arpeggios"
	}
	
	if exercises.has(exercise_type):
		var exercise_method = exercises[exercise_type]
		var exercise_sequence = self.call(exercise_method, key)
		sequence_manager.set_sequence(exercise_sequence)

# Exercise creation methods
func create_scale(key: String) -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "scale"

	var scale_notes = key_to_exercises[key].scales
	
	for note_data in scale_notes:
		var note = PianoNote.new(note_data[0], "R", note_data[1])
		sequence.add_position([note])
	
	return sequence

func create_chord_inversions(key: String) -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "chord_inversions"
	
	var chord_notes = key_to_exercises[key].chords
	
	for chord in chord_notes:
		var position: Array[PianoNote] = []
		for note_data in chord:
			var note = PianoNote.new(note_data[0], "R", note_data[1])
			position.append(note)
		sequence.add_position(position)
	
	return sequence

func create_arpeggios(key: String) -> PracticeSequence:
	var sequence = PracticeSequence.new()
	sequence.exercise_type = "arpeggio"
	
	var arpeggio_notes = key_to_exercises[key].arpeggios
	
	for note_data in arpeggio_notes:
		var note = PianoNote.new(note_data[0], "R", note_data[1])
		sequence.add_position([note])
	
	return sequence
