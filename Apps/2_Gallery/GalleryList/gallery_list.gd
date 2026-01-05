class_name GalleryList
extends Control

const THUMBNAIL_SCENE = preload("uid://bco2f5tc6jwnu")

signal requested_view_photo(photo_data: PhotoData)

@export var initial_photos: Array[PhotoData] = []

@onready var margin_container: MarginContainer = %MarginContainer
@onready var photo_grid: GridContainer = %PhotoGrid

func _ready() -> void:
	for child in photo_grid.get_children():
		child.queue_free()
	
	var columns := photo_grid.columns
	var screen_width := get_parent_area_size().x
	var margins_width :=  margin_container.get_theme_constant(&"margin_left") * 2
	var grid_separation := photo_grid.get_theme_constant(&"h_separation") * (columns - 1)
	var cell_width := (screen_width - margins_width - grid_separation) / columns
	
	for photo_data in initial_photos:
		var thumb := THUMBNAIL_SCENE.instantiate() as PhotoThumbnail
		photo_grid.add_child(thumb)
		thumb.setup(photo_data, cell_width)
		thumb.pressed.connect(func() -> void:
			requested_view_photo.emit(photo_data))
