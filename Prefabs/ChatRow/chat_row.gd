class_name ChatRow
extends Button

signal chat_selected(chat_data: ChatData)

var chat_data: ChatData

@onready var avatar: TextureRect = %Avatar
@onready var name_label: Label = %NameLabel
@onready var preview_label: Label = %PreviewLabel

func setup(data: ChatData) -> void:
	chat_data = data

	name_label.text = data.contact_name
	if data.profile_pic:
		avatar.texture = data.profile_pic
	
	if data.conversation.size() > 0:
		var last_msg := data.conversation[-1]
		preview_label.text = last_msg.text
	else:
		preview_label.text = ""

func _pressed() -> void:
	chat_selected.emit(chat_data)
