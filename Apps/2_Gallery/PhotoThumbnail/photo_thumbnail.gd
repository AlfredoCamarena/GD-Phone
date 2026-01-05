class_name PhotoThumbnail
extends TextureButton

var photo_data: PhotoData

func setup(data: PhotoData, cell_width: float) -> void:
	photo_data = data
	texture_normal = data.image
	
	custom_minimum_size = Vector2(cell_width, cell_width)
