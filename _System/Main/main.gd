extends Control

@onready var app_container: Control = %AppContainer
@onready var home_button: Button = %HomeButton
@onready var call_screen: CallScreen = %CallScreen
@onready var notification_banner: NotificationBanner = %NotificationBanner

@export var home_scene: PackedScene

func _connect_signals() -> void:
	home_button.pressed.connect(func() -> void:
		_open_app(home_scene))
	SignalBus.open_app_requested.connect(_open_app)
	SignalBus.open_webpage_requested.connect(_open_webpage)
	EventManager.trigger_call.connect(_on_event_call)
	EventManager.trigger_photo_unlock.connect(_on_event_photo_unlocked)
	EventManager.trigger_notification.connect(_on_event_notification)


func _ready() -> void:
	_connect_signals()


func _open_app(scene: PackedScene) -> Node:
	_clear_app_container()
	
	var new_app := scene.instantiate()
	app_container.add_child(new_app)
	return new_app


func _clear_app_container() -> void:
	for child in app_container.get_children():
		child.queue_free()


func _open_webpage(data: WebpageData) -> void:
	const WEB_BROWSER_SCENE = preload("uid://c15x2ptcs1e2l")
	var browser := _open_app(WEB_BROWSER_SCENE) as WebBrowserApp
	browser.navigate_to_page(data)


func _on_event_call(contact: ContactData, voice_audio: AudioStream) -> void:
	call_screen.start_call(contact, voice_audio)


func _on_event_photo_unlocked(photo_data: PhotoData) -> void:
	PlayerData.add_photo(photo_data)


func _on_event_notification(notification_data: NotificationData) -> void:
	notification_banner.show_notification(notification_data)
