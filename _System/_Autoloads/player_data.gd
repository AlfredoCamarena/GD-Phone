extends Node

var unlocked_photos: Array[PhotoData]

signal photo_unlocked(new_photo: PhotoData)

func add_photo(photo: PhotoData) -> void:
	if not photo in unlocked_photos:
		unlocked_photos.append(photo)
		photo_unlocked.emit(photo)
		
		var new_photo_notification := preload("uid://dcb0bjeeoa2re")
		EventManager.trigger_notification.emit(new_photo_notification)
