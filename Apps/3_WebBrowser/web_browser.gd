extends Control

@onready var back_button: Button = %BackButton
@onready var forward_button: Button = %ForwardButton
@onready var home_button: Button = %HomeButton
@onready var url_label: Label = %UrlLabel
@onready var page_container: Control = %PageContainer

@export var home_scene: PackedScene

var navigation_history: Array[PackedScene]
var current_history_index: int = -1
var current_webpage_data: WebpageData


func load_webpage(data: WebpageData) -> void:
	current_webpage_data = data
	url_label.text = data.url
	_navigate_to_scene(data.scene)


func _ready() -> void:
	back_button.pressed.connect(_go_back)
	forward_button.pressed.connect(_go_forward)
	home_button.pressed.connect(_go_home)
	_go_home()


func _go_back() -> void:
	if current_history_index <= 0:
		return
	current_history_index -= 1
	_clear_page_container()
	_instantiate_page(navigation_history[current_history_index])
	_update_nav_buttons()


func _go_forward() -> void:
	if current_history_index >= navigation_history.size() - 1:
		return
	current_history_index += 1
	_clear_page_container()
	_instantiate_page(navigation_history[current_history_index])
	_update_nav_buttons()


func _go_home() -> void:
	current_webpage_data = null
	url_label.text = ""
	_navigate_to_scene(home_scene)


func _navigate_to_scene(target_scene: PackedScene) -> void:
	var target_is_current_scene := !navigation_history.is_empty()\
		and navigation_history[current_history_index] == target_scene
	if (target_is_current_scene):
		return
	
	_clear_page_container()
	
	if current_history_index < navigation_history.size() - 1:
		navigation_history.resize(current_history_index + 1)
	
	navigation_history.append(target_scene)
	current_history_index = navigation_history.size() - 1
	
	_instantiate_page(target_scene)
	_update_nav_buttons()


func _clear_page_container() -> void:
	for child in page_container.get_children():
		child.queue_free()


func _instantiate_page(scene: PackedScene) -> void:
	var page_instance := scene.instantiate() as WebPage
	page_container.add_child(page_instance)
	page_instance.navigate_to_url_requested.connect(func (url: String) -> void:
		_navigate_to_scene(WebManager.get_url_data(url).scene))
	page_instance.trigger_event_requested.connect(func (event: StoryEvent) -> void:
		EventManager.execute(event))


func _update_nav_buttons() -> void:
	back_button.disabled = current_history_index <= 0
	forward_button.disabled = current_history_index >= navigation_history.size() - 1
