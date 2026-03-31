extends Node

var unlocked_photos: Array[PhotoData]
#TODO: Improve webpage example
var unlocked_webpages: Array[WebpageData] = [preload("uid://cdvpujykux1pc"), preload("uid://cxbcc7gfhusea")]

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
