class_name CallScreen
extends Control

signal call_accepted
signal call_ended

@onready var photo_rect: TextureRect = %PhotoRect
@onready var name_label: Label = %NameLabel
@onready var status_label: Label = %StatusLabel
@onready var timer_label: Label = %TimerLabel
@onready var decline_button: Button = %DeclineButton
@onready var accept_button: Button = %AcceptButton
@onready var ringtone_player: AudioStreamPlayer = %RingtonePlayer
@onready var voice_player: AudioStreamPlayer = %VoicePlayer

var is_active_call := false
var call_duration := 0.0

func start_call(voice_audio: AudioStream, contact_name: String = "Unkown", photo: Texture2D = null) -> void:
	voice_player.stream = voice_audio
	name_label.text = contact_name
	if photo:
		photo_rect.texture = photo
	
	_reset_ui()
	
	show()
	ringtone_player.play()


func stop_call() -> void:
	is_active_call = false
	set_process(false)
	ringtone_player.stop()
	voice_player.stop()
	hide()


func _ready() -> void:
	accept_button.pressed.connect(_on_accept)
	decline_button.pressed.connect(_on_decline)
	set_process(false)


func _process(delta: float) -> void:
	if is_active_call:
		call_duration += delta
		timer_label.text = _format_time(call_duration)
		
		if not voice_player.playing and call_duration > 1.0:
			_on_decline()


func _reset_ui() -> void:
	is_active_call = false
	call_duration = 0.0
	timer_label.text = _format_time(call_duration)
	
	timer_label.hide()
	status_label.text = "is calling"
	status_label.show()
	accept_button.show()
	decline_button.show()


func _format_time(seconds: float) -> String:
	var mins := int(seconds / 60)
	var secs := int(seconds) % 60
	return "%02d:%02d" % [mins, secs]


func _on_accept() -> void:
	ringtone_player.stop()
	call_accepted.emit()
	
	is_active_call = true
	set_process(true)
	
	accept_button.hide()
	status_label.hide()
	timer_label.show()
	
	voice_player.play()


func _on_decline() -> void:
	stop_call()
	call_ended.emit()
