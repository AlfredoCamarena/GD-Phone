extends WebPage

@export var url: String

@onready var button: Button = $PanelContainer/VBoxContainer/Button

func _ready() -> void:
	button.pressed.connect(func()->void:
		navigate_to_url_requested.emit(url))
