extends Control

@onready var app_container: Control = %AppContainer
@onready var home_button: Button = %HomeButton

@export var home_scene: PackedScene

func _connect_signals() -> void:
	home_button.pressed.connect(func() -> void:
		_open_app(home_scene))
	SignalBus.open_app_requested.connect(_open_app)


func _ready() -> void:
	_connect_signals()


func _open_app(scene: PackedScene) -> void:
	_clear_app_container()
	
	var new_app := scene.instantiate()
	app_container.add_child(new_app)


func _clear_app_container() -> void:
	for child in app_container.get_children():
		child.queue_free()
