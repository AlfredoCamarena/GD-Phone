class_name WebBrowserApp
extends Control

@onready var back_button: Button = %BackButton
@onready var forward_button: Button = %ForwardButton
@onready var home_button: Button = %HomeButton
@onready var url_label: Label = %UrlLabel
@onready var page_container: Control = %PageContainer

@export var home_scene: PackedScene

var navigation_history: Array[WebpageData]
var current_history_index: int = -1
var current_webpage_data: WebpageData


func navigate_to_page(data: WebpageData) -> void:
	var target_is_current := !navigation_history.is_empty() \
		and navigation_history[current_history_index] == data
	
	if target_is_current:
		return
	
	if current_history_index < navigation_history.size() - 1:
		navigation_history.resize(current_history_index + 1)
	
	navigation_history.append(data)
	current_history_index = navigation_history.size() - 1
	_display_page(data)


func _ready() -> void:
	back_button.pressed.connect(_go_back)
	forward_button.pressed.connect(_go_forward)
	home_button.pressed.connect(_go_home)
	_go_home()


func _go_home() -> void:
	navigate_to_page(null)


func _go_back() -> void:
	if current_history_index <= 0:
		return
	current_history_index -= 1
	_display_page(navigation_history[current_history_index])


func _go_forward() -> void:
	if current_history_index >= navigation_history.size() - 1:
		return
	current_history_index += 1
	_display_page(navigation_history[current_history_index])


func _display_page(data: WebpageData) -> void:
	current_webpage_data = data
	url_label.text = data.url if data else ""
	
	for child in page_container.get_children():
		child.queue_free()
	
	var scene_to_load := data.scene if data else home_scene
	_instantiate_page(scene_to_load)
	_update_nav_buttons()


func _instantiate_page(scene: PackedScene) -> void:
	var page_instance := scene.instantiate() as WebPage
	page_container.add_child(page_instance)
	page_instance.navigate_to_url_requested.connect(func (url: String) -> void:
		navigate_to_page(WebManager.get_url_data(url)))
	page_instance.trigger_event_requested.connect(func (event: StoryEvent) -> void:
		EventManager.execute(event))


func _update_nav_buttons() -> void:
	back_button.disabled = current_history_index <= 0
	forward_button.disabled = current_history_index >= navigation_history.size() - 1
