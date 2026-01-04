class_name ChatDetail
extends Control

const BUBBLE_ME = preload("uid://cnmccr7wi7o5r")
const BUBBLE_OTHER = preload("uid://dcqg1uuswi4y8")

@onready var messages_container: VBoxContainer = %MessagesContainer
@onready var name_label: Label = %NameLabel
@onready var back_button: Button = %BackButton
@onready var avatar: TextureRect = %Avatar
@onready var message_scroll: ScrollContainer = %MessageScroll

signal requested_go_back

func _ready() -> void:
	back_button.pressed.connect(func() -> void:
		requested_go_back.emit())


func setup(chat_data: ChatData) -> void:
	name_label.text = chat_data.contact_name
	if chat_data.profile_pic:
		avatar.texture = chat_data.profile_pic
	
	for child in messages_container.get_children():
		child.queue_free()
	
	for msg in chat_data.conversation:
		add_message_bubble(msg)
	
	message_scroll.scroll_vertical = message_scroll.get_v_scroll_bar().max_value as int


func add_message_bubble(msg_data: MessageData) -> void:
	var bubble: ChatBubble
	
	if msg_data.sender == MessageData.Sender.ME:
		bubble = BUBBLE_ME.instantiate() as ChatBubble
	else:
		bubble = BUBBLE_OTHER.instantiate() as ChatBubble
		
	messages_container.add_child(bubble)
	bubble.setup(msg_data.text)
	
