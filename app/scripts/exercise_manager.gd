extends Control

# Signals
signal clear_highlighted_keys

# Node references
@onready var hand_dropdown = $HBoxContainer/HandDropdown
@onready var exercise_type_dropdown = $HBoxContainer/ExerciseTypeDropdown
@onready var music_key_dropdown = $HBoxContainer/KeyDropdown
@onready var sequence_manager = get_parent().get_node("SequenceManager")

# Load exercises
@onready var scales = load("res://scripts/exercises/scales_major.gd").new()
@onready var chords = load("res://scripts/exercises/chords_major.gd").new()
@onready var arpeggios = load("res://scripts/exercises/arpeggios_major.gd").new()

# Named entity for exercise map
class ExerciseMap:
	var scales: Dictionary
	var chords: Dictionary
	var arpeggios: Dictionary
	
	func _init(_scales: Dictionary, _chords: Dictionary, _arpeggios: Dictionary):
		scales = _scales
		chords = _chords
		arpeggios = _arpeggios

# Helper method to create exercise maps
func create_exercise_map(key: String) -> ExerciseMap:
	var key_snake = key.to_snake_case()
	return ExerciseMap.new(
		{
			"R": scales.get(key_snake + "_major_rh_1oct"),
			"L": scales.get(key_snake + "_major_lh_1oct")
		},
		{
			"R": chords.get(key_snake + "_major_rh_inversions"),
			"L": chords.get(key_snake + "_major_lh_inversions")
		},
		{
			"R": arpeggios.get(key_snake + "_major_rh_arpeggios"),
			"L": arpeggios.get(key_snake + "_major_lh_arpeggios")
		}
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
	hand_dropdown.connect("item_selected", _on_hand_selected)
	exercise_type_dropdown.connect("item_selected", _on_exercise_type_selected)
	music_key_dropdown.connect("item_selected", _on_key_selected)
	_initialize_dropdowns()
	call_deferred("_update_exercise")

func _initialize_dropdowns():
	# Initialize hand selection
	hand_dropdown.clear()
	hand_dropdown.add_item("Right Hand")
	hand_dropdown.add_item("Left Hand")
	
	# Initialize exercise types
	exercise_type_dropdown.clear()
	exercise_type_dropdown.add_item("Scales")
	exercise_type_dropdown.add_item("Chords")
	exercise_type_dropdown.add_item("Arpeggios")
	
	_update_key_dropdown()

func _update_key_dropdown():
	music_key_dropdown.clear()
	var music_keys = ["C", "G", "D", "A", "E", "B", "F#", "C#", "F", "Bb", "Eb", "Ab"]
	for music_key in music_keys:
		music_key_dropdown.add_item(music_key)

func _on_exercise_type_selected(index):
	_update_key_dropdown()
	_update_exercise()

func _on_key_selected(index):
	_update_exercise()

func _on_hand_selected(index):
	_update_exercise()

func _update_exercise():
	emit_signal("clear_highlighted_keys")
	
	var exercise_type = exercise_type_dropdown.get_item_text(exercise_type_dropdown.selected)
	var music_key = music_key_dropdown.get_item_text(music_key_dropdown.selected)
	var hand = "R" if hand_dropdown.get_item_text(hand_dropdown.selected).begins_with("Right") else "L"
	print(exercise_type, music_key, hand)
	var exercises = {
		"Scales": "create_scale",
		"Chords": "create_chord_inversions",
		"Arpeggios": "create_arpeggios"
	}
	
	if exercises.has(exercise_type):
		var exercise_method = exercises[exercise_type]
		var exercise_sequence = self.call(exercise_method, music_key, hand)
		sequence_manager.set_sequence(exercise_sequence)

# Exercise creation methods
func create_scale(music_key: String, hand: String) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = "scale"
	
	var scale_notes = key_to_exercises[music_key].scales[hand]
	for note_data in scale_notes:
		var note = PianoNote.new(note_data[0], hand, note_data[1])
		practice_sequence.add_position([note])
	
	return practice_sequence

func create_chord_inversions(music_key: String, hand: String) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = "chord_inversions"
	
	var chord_notes = key_to_exercises[music_key].chords[hand]
	for chord in chord_notes:
		var chord_position: Array[PianoNote] = []
		for note_data in chord:
			var note = PianoNote.new(note_data[0], hand, note_data[1])
			chord_position.append(note)
		practice_sequence.add_position(chord_position)
	
	return practice_sequence

func create_arpeggios(music_key: String, hand: String) -> PracticeSequence:
	var practice_sequence = PracticeSequence.new()
	practice_sequence.exercise_type = "arpeggio"
	
	var arpeggio_notes = key_to_exercises[music_key].arpeggios[hand]
	for note_data in arpeggio_notes:
		var note = PianoNote.new(note_data[0], hand, note_data[1])
		practice_sequence.add_position([note])
	
	return practice_sequence
