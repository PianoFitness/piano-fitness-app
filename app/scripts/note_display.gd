extends RichTextLabel

const NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B", "Db", "Eb", "Gb", "Ab", "Bb"]

# We'll store both the display name and the MIDI note number for proper sorting
class NoteInfo:
	var display_name: String
	var midi_note: int
	
	func _init(name: String, note: int):
		display_name = name
		midi_note = note

var active_notes: Array[NoteInfo] = []

func _ready():
	bbcode_enabled = true
	fit_content = true
	autowrap_mode = TextServer.AUTOWRAP_OFF
	add_theme_font_size_override("normal_font_size", 24)
	text = "No keys pressed"

func get_note_name(midi_note: int) -> String:
	var octave = (midi_note - 12) / 12
	var note = (midi_note - 12) % 12
	var note_name = NOTE_NAMES[note]
	
	# Add special formatting for accidentals (sharp and flat notes)
	if "#" in note_name or "b" in note_name:
		return "[color=cyan]%s[/color]%s" % [note_name, str(octave)]
	return note_name + str(octave)

func update_note_state(note: int, is_active: bool) -> void:
	var note_name = get_note_name(note)
	
	if is_active:
		# Check if note is already in the array
		var existing = active_notes.filter(func(info): return info.midi_note == note)
		if existing.is_empty():
			# Add new note with both display name and MIDI number
			active_notes.append(NoteInfo.new(note_name, note))
	else:
		# Remove note based on MIDI number
		active_notes = active_notes.filter(func(info): return info.midi_note != note)
	
	# Sort by MIDI note number (pitch order)
	active_notes.sort_custom(func(a, b): return a.midi_note < b.midi_note)
	
	if active_notes.is_empty():
		text = "No keys pressed"
	else:
		# Create display text using sorted note names
		var display_names = active_notes.map(func(info): return info.display_name)
		text = "Playing: " + " [color=gray]•[/color] ".join(display_names)
