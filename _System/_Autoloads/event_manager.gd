extends Node

signal trigger_call(contact: ContactData, voice: AudioStream)
signal trigger_photo_unlock(photo_data: PhotoData)
signal trigger_notification(title: String, body: String)

func execute(event: StoryEvent) -> void:
	if event.delay > 0:
		await get_tree().create_timer(event.delay).timeout
	
	match event.type:
		StoryEvent.Type.INCOMING_CALL:
			if event.target_resource is ContactData:
				trigger_call.emit(event.target_resource, null)
			else:
				push_error("The Incoming Call event must have a target resource of type ContactData")
		StoryEvent.Type.UNLOCK_PHOTO:
			pass
		StoryEvent.Type.NOTIFICATION:
			pass
