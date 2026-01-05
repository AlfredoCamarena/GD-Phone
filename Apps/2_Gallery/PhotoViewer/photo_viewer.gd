class_name PhotoViewer
extends Control

@onready var back_button: Button = %BackButton
@onready var full_photo: TextureRect = %FullPhoto
@onready var date_label: Label = %DateLabel
@onready var time_label: Label = %TimeLabel
@onready var location_label: Label = %LocationLabel
@onready var time_location_separator: VSeparator = %TimeLocationSeparator

signal requested_go_back

func _ready() -> void:
	back_button.pressed.connect(func() -> void:
		requested_go_back.emit())


func setup(photo_data: PhotoData) -> void:
	full_photo.texture = photo_data.image
	date_label.text = photo_data.date
	time_label.text = photo_data.time
	location_label.text = photo_data.location
	
	if time_label.text.is_empty() or location_label.text.is_empty():
		time_location_separator.hide()
	else:
		time_location_separator.show()
