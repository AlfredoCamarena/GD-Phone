extends WebPage

@export var url: String
@export var event: StoryEvent

@onready var button: Button = $PanelContainer/VBoxContainer/Button
@onready var button_2: Button = $PanelContainer/VBoxContainer/Button2

func _ready() -> void:
	button.pressed.connect(func()->void:
		navigate_to_url_requested.emit(url))
	button_2.pressed.connect(func()->void:
		trigger_event_requested.emit(event))
