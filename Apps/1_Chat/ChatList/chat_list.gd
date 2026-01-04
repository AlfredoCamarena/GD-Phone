class_name ChatList
extends Control

const CONTACT_ROW_SCENE := preload("uid://f447clfv0fb1")
const CHATS_PATH = "res://Data/Chats/"

signal requested_open_chat(data: ChatData)

@onready var chats_container: VBoxContainer = %ChatsContainer

func _ready() -> void:
	for child in chats_container.get_children():
		child.queue_free()
	
	var dir := DirAccess.open(CHATS_PATH)
	dir.list_dir_begin()
	
	var file_name := dir.get_next()
	while file_name != "":
		if file_name.ends_with(".tres") or file_name.ends_with(".remap"):
			var clean_name := file_name.replace(".remap", "")
			var resource := load(CHATS_PATH + clean_name) as ChatData
			if resource:
				create_row(resource)
		file_name = dir.get_next()


func create_row(data: ChatData) -> void:
	var new_row := CONTACT_ROW_SCENE.instantiate() as ChatRow
	chats_container.add_child(new_row)
	new_row.setup(data)
	new_row.chat_selected.connect(_on_chat_selected)


func _on_chat_selected(data: ChatData) -> void:
	requested_open_chat.emit(data)
