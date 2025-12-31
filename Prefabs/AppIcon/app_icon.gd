class_name AppIcon
extends Button

@export var app_scene: PackedScene

func _ready() -> void:
	pressed.connect(func() -> void:
		SignalBus.open_app_requested.emit(app_scene))
