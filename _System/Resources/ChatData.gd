class_name ChatData
extends Resource

@export_group("Perfil de Contacto")
@export var contact_name := "Desconocido"
@export var profile_pic := preload("uid://fi042hb8xr13")
@export var contact_id := "unique_id_001"
@export_group("Historial")
@export var conversation: Array[MessageData]
@export_group("Estado")
@export var is_locked := false
@export var has_unread_messages := false
