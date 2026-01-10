extends Node

signal trigger_call(contact_name: String, photo: Texture2D, voice: AudioStream)
signal trigger_photo_unlock(photo_data: PhotoData)
signal trigger_notification(title: String, body: String)

func execute(event: StoryEvent) -> void:
	if event.delay > 0:
		await get_tree().create_timer(event.delay).timeout
	
	match event.type:
		StoryEvent.Type.INCOMING_CALL:
			# TODO: mejorarar la lógica creando un nuevo recurso
			if event.target_resource is Texture2D:
				trigger_call.emit("Desconocido", event.target_resource, null)
		StoryEvent.Type.UNLOCK_PHOTO:
			pass
		StoryEvent.Type.NOTIFICATION:
			pass
