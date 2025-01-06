extends Control

signal beat_played(beat_number: int)

const MIN_BPM = 40
const MAX_BPM = 208
const SECONDS_PER_MINUTE = 60.0
const BEATS_PER_BAR = 4

const SOUNDS = {
	"bell": preload("res://assets/sound/bell.wav"),
	"click": preload("res://assets/sound/click.wav"),
	"digital": preload("res://assets/sound/digital.wav"),
	"wood": preload("res://assets/sound/wood.wav")
}

const COLORS = {
	"accent": Color(0.4, 0.7, 1.0),
	"normal": Color(0.3, 0.5, 0.8),
	"inactive": Color(0.2, 0.2, 0.2)
}

const DEFAULT_SETTINGS = {
	"bpm": 120.0,
	"volume_db": -6.0,
	"sound": "digital"
}

var sound_players: Dictionary = {}
var is_playing: bool = false
var current_beat: int = -1
var time_since_last_beat: float = 0.0
var beat_interval: float
var bpm: float = DEFAULT_SETTINGS.bpm
var volume_db: float = DEFAULT_SETTINGS.volume_db
var current_sound: String = DEFAULT_SETTINGS.sound

@onready var ui = {
	"play_button": %PlayButton,
	"sound_option": %SoundOption,
	"tempo_slider": %TempoSlider,
	"tempo_label": %TempoLabel,
	"volume_slider": %VolumeSlider,
	"beat_indicator": %BeatIndicator
}

func _ready():
	setup_sound_players()
	setup_ui()
	update_beat_interval()

func setup_sound_players():
	for sound_name in SOUNDS:
		var player = AudioStreamPlayer.new()
		player.stream = SOUNDS[sound_name]
		player.bus = "Metronome"
		$AudioPlayers.add_child(player)
		sound_players[sound_name] = player

func setup_ui():
	ui.play_button.pressed.connect(_on_play_button_pressed)
	ui.sound_option.item_selected.connect(_on_sound_selected)
	ui.tempo_slider.value_changed.connect(_on_tempo_changed)
	ui.volume_slider.value_changed.connect(_on_volume_changed)
	
	for sound_name in SOUNDS.keys():
		ui.sound_option.add_item(sound_name.capitalize())
	
	ui.sound_option.selected = SOUNDS.keys().find(DEFAULT_SETTINGS.sound)
	ui.tempo_slider.value = DEFAULT_SETTINGS.bpm
	ui.volume_slider.value = DEFAULT_SETTINGS.volume_db

func _process(delta):
	if is_playing:
		time_since_last_beat += delta
		if time_since_last_beat >= beat_interval:
			play_beat()
			time_since_last_beat -= beat_interval

func update_beat_interval():
	beat_interval = SECONDS_PER_MINUTE / bpm

func play_beat():
	current_beat = (current_beat + 1) % BEATS_PER_BAR
	var player = sound_players[current_sound]
	player.volume_db = volume_db
	player.play()
	
	ui.beat_indicator.color = COLORS.accent if current_beat == 0 else COLORS.normal
	create_tween().tween_property(ui.beat_indicator, "color", COLORS.inactive, 0.1)
	
	emit_signal("beat_played", current_beat)

func _on_play_button_pressed():
	if is_playing:
		stop()
		ui.play_button.text = "Play"
	else:
		start()
		ui.play_button.text = "Stop"

func _on_sound_selected(idx: int):
	current_sound = SOUNDS.keys()[idx]

func _on_tempo_changed(value: float):
	bpm = value
	update_beat_interval()
	ui.tempo_label.text = str(int(value))

func _on_volume_changed(value: float):
	volume_db = value

func start():
	current_beat = -1
	time_since_last_beat = 0
	is_playing = true

func stop():
	is_playing = false
	current_beat = -1
