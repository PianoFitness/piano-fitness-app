extends PanelContainer

signal beat_played(beat_number: int)

const MIN_BPM = 40
const MAX_BPM = 208
const SECONDS_PER_MINUTE = 60.0

var bpm: float = 120.0
var is_playing: bool = false
var current_beat: int = 0
var time_since_last_beat: float = 0.0
var beat_interval: float
var volume_db: float = -6.0
var current_sound: String = "click"

var sound_players: Dictionary = {}

func _ready():
	update_beat_interval()
	setup_sound_players()
	connect_signals()

func setup_sound_players():
	var players_node = $AudioPlayers
	for child in players_node.get_children():
		var sound_name = child.name.to_lower().replace("player", "")
		sound_players[sound_name] = child

func connect_signals():
	var ui_root = $MarginContainer/VBox
	
	ui_root.get_node("TopRow/PlayButton").pressed.connect(_on_play_button_pressed)
	ui_root.get_node("TopRow/SoundOption").item_selected.connect(_on_sound_selected)
	ui_root.get_node("TempoContainer/TempoSlider").value_changed.connect(_on_tempo_changed)
	ui_root.get_node("VolumeContainer/VolumeSlider").value_changed.connect(_on_volume_changed)

func _process(delta):
	if is_playing:
		time_since_last_beat += delta
		if time_since_last_beat >= beat_interval:
			play_beat()
			time_since_last_beat -= beat_interval

func update_beat_interval():
	beat_interval = SECONDS_PER_MINUTE / bpm

func play_beat():
	current_beat = (current_beat + 1) % 4
	var player = sound_players[current_sound]
	player.volume_db = volume_db
	player.play()
	emit_signal("beat_played", current_beat)
	
	var indicator = $MarginContainer/VBox/TopRow/BeatIndicator
	indicator.color = Color(0.4, 0.7, 1.0) if current_beat == 0 else Color(0.3, 0.5, 0.8)
	create_tween().tween_property(indicator, "color", Color(0.2, 0.2, 0.2), 0.1)

func _on_play_button_pressed():
	if is_playing:
		stop()
		$MarginContainer/VBox/TopRow/PlayButton.text = "Play"
	else:
		start()
		$MarginContainer/VBox/TopRow/PlayButton.text = "Stop"

func _on_sound_selected(idx: int):
	var sounds = ["click", "bell", "wood", "digital"]
	current_sound = sounds[idx]

func _on_tempo_changed(value: float):
	bpm = value
	update_beat_interval()
	$MarginContainer/VBox/TempoContainer/TempoLabel.text = str(int(value))

func _on_volume_changed(value: float):
	volume_db = value

func start():
	current_beat = -1
	time_since_last_beat = 0
	is_playing = true

func stop():
	is_playing = false
	current_beat = -1
