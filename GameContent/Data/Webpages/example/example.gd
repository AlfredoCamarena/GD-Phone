extends WebPage

@export var target_page: PackedScene

@onready var button: Button = $PanelContainer/VBoxContainer/Button

func _ready() -> void:
	button.pressed.connect(func()->void:
		navigate_to_page_requested.emit(target_page))
