class_name AppIcon
extends Button

@export var app_name: String = "App"
@export var icon_texture: Texture2D
@export var app_scene: PackedScene

@onready var icon_img: TextureRect = $IconImg
@onready var name_label: Label = $NameLabel

func _ready() -> void:
	name_label.text = app_name
	if icon_texture:
		icon_img.texture = icon_texture
	
	pressed.connect(func() -> void:
		SignalBus.open_app_requested.emit(app_scene))
