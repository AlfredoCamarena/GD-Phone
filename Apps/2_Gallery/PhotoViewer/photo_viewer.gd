class_name PhotoViewer
extends Control

@onready var back_button: Button = %BackButton
@onready var full_photo: TextureRect = %FullPhoto

signal requested_go_back

func _ready() -> void:
	back_button.pressed.connect(func() -> void:
		requested_go_back.emit())


func setup(photo: Texture2D) -> void:
	#TODO: Add animation
	full_photo.texture = photo
