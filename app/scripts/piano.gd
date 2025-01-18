extends Control

# Piano note constants
const NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
const STARTING_MIDI_NOTE = 24 # C1 in MIDI
const KEYS_PER_OCTAVE = 12

# Color definitions for various key states
const LESSON_COLOR = Color(0.3, 0.8, 0.3, 1.0) # Green for target notes
const STUDENT_COLOR = Color(0.8, 0.8, 1.0, 1.0) # Light blue for played notes

# Chord input handling constants
const CHORD_COLLECTION_WINDOW: float = 0.1 # 100ms window to collect chord notes

# Constants for piano key dimensions
const WHITE_KEY_HEIGHT_RATIO = 0.3 # Piano takes up 30% of the viewport height

# State variables
var current_chord_notes: Array[int] = [] # Collects notes played within time window
var chord_collection_timer: float = 0.0 # Timer for chord note collection

# Node references
var sequence_manager: SequenceManager
var finger_display: FingerDisplay

@onready var note_display = $NoteDisplay
@onready var piano_keys = $PianoKeys

func _ready():
	var viewport_size = get_viewport_rect().size
	piano_keys.position = Vector2(0, viewport_size.y - viewport_size.y * WHITE_KEY_HEIGHT_RATIO)
	piano_keys.create_piano_keys(viewport_size)
	setup_fingering_system()
	OS.open_midi_inputs()

func _process(delta: float):
	# Handle chord collection timing
	if chord_collection_timer > 0:
		chord_collection_timer -= delta
		if chord_collection_timer <= 0:
			if sequence_manager and current_chord_notes.size() > 0:
				if sequence_manager.validate_input(current_chord_notes):
					sequence_manager.advance_sequence()
			current_chord_notes.clear()

func setup_fingering_system():
	# Initialize finger display and sequence manager
	finger_display = $PianoKeys/FingerDisplay
	if not finger_display:
		push_error("FingerDisplay node not found in scene (should be at PianoKeys/FingerDisplay)")
		return
	
	sequence_manager = $SequenceManager
	if not sequence_manager:
		push_error("SequenceManager node not found in scene")
		return
	piano_keys = $PianoKeys
	sequence_manager.initialize(piano_keys, finger_display)

func _input(event):
	if event is InputEventMIDI:
		handle_midi_event(event)

func handle_midi_event(event: InputEventMIDI):
	var note = event.pitch
	var key = piano_keys.get_key_by_midi(note)
	if not key:
		return
		
	if event.message == MIDI_MESSAGE_NOTE_ON and event.velocity > 0:
		key.color = STUDENT_COLOR
		if not current_chord_notes.has(note):
			current_chord_notes.append(note)
		chord_collection_timer = CHORD_COLLECTION_WINDOW
		
		note_display.update_note_state(note, true)
	elif event.message == MIDI_MESSAGE_NOTE_OFF or (event.message == MIDI_MESSAGE_NOTE_ON and event.velocity == 0):
		reset_key_color(key, note)
		note_display.update_note_state(note, false)

func reset_key_color(key: ColorRect, note: int):
	var current_notes = get_current_lesson_notes()
	if current_notes.has(note):
		key.color = LESSON_COLOR
	else:
		key.color = piano_keys.get_inactive_key_color(note)

func get_current_lesson_notes() -> Array[int]:
	var notes: Array[int] = []
	if sequence_manager and sequence_manager.current_sequence:
		var current_chord = sequence_manager.current_sequence.sequence[sequence_manager.current_position]
		for note in current_chord:
			notes.append(note_name_to_midi(note.pitch))
	return notes

func note_name_to_midi(note_name: String) -> int:
	var note = note_name.left(len(note_name) - 1)
	var octave = int(note_name.right(1))
	var note_index = NOTE_NAMES.find(note)
	if note_index != -1:
		return STARTING_MIDI_NOTE + (octave * KEYS_PER_OCTAVE) + note_index
	return -1

func midi_to_note_name(midi_note: int) -> String:
	var octave = (midi_note - STARTING_MIDI_NOTE) / KEYS_PER_OCTAVE
	var note_index = (midi_note - STARTING_MIDI_NOTE) % KEYS_PER_OCTAVE
	return NOTE_NAMES[note_index] + str(octave)
