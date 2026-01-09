class_name CallScreen
extends Control

signal call_accepted
signal call_declined

@onready var photo_rect: TextureRect = %PhotoRect
@onready var name_label: Label = %NameLabel
@onready var status_label: Label = %StatusLabel
@onready var decline_button: Button = %DeclineButton
@onready var accept_button: Button = %AcceptButton
@onready var ringtone_player: AudioStreamPlayer = %RingtonePlayer

func _ready() -> void:
	accept_button.pressed.connect(_on_accept)
	decline_button.pressed.connect(_on_decline)


func start_call(contact_name: String = "Unkown", photo: Texture2D = null) -> void:
	status_label.text = "is calling"
	name_label.text = contact_name
	if photo:
		photo_rect.texture = photo
		
	show()
	ringtone_player.play()


func _on_accept() -> void:
	call_accepted.emit()
	#TODO: Agregar pantalla de llamada activa
	stop_call()


func _on_decline() -> void:
	status_label.text = "call declined"
	call_declined.emit()
	stop_call()


func stop_call() -> void:
	hide()
	ringtone_player.stop()
