class_name ChatData
extends Resource

@export_group("Contact")
@export var contact: ContactData
@export_group("Historial")
@export var conversation: Array[MessageData]
@export_group("Estado")
@export var is_locked := false
@export var has_unread_messages := false
