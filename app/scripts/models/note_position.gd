extends Resource

const FingeredNote = preload("res://scripts/models/fingered_note.gd")

var notes: Array[FingeredNote]

func _init(_notes: Array[FingeredNote]):
	self.notes = _notes
