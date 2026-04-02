extends Node

var unlocked_photos: Array[PhotoData]
#TODO: Remove dummy pages before pushing
var unlocked_webpages: Array[WebpageData] = [
	preload("uid://da6j7k6txtj65"),
	preload("uid://b5x5vxmwbg3w")
]

signal photo_unlocked(new_photo: PhotoData)
signal webpage_unlocked(new_webpage: WebpageData)

func add_photo(photo: PhotoData) -> void:
	if not photo in unlocked_photos:
		unlocked_photos.append(photo)
		photo_unlocked.emit(photo)


func unlock_webpage(webpage: WebpageData) -> void:
	if not webpage in unlocked_webpages:
		unlocked_webpages.append(webpage)
		webpage_unlocked.emit(webpage)
