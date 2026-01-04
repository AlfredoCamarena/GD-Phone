class_name ChatBubble
extends PanelContainer

@onready var message_label: Label = $MessageLabel

func setup(msg: String) -> void:
	message_label.text = msg
	
	var max_allowed_width := get_viewport_rect().size.x * 0.75
	var font := message_label.get_theme_font("font")
	var font_size := message_label.get_theme_font_size("font_size")
	var text_size := font.get_string_size(message_label.text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size)
	
	if text_size.x > max_allowed_width:
		message_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		message_label.custom_minimum_size.x = max_allowed_width
	else:
		message_label.autowrap_mode = TextServer.AUTOWRAP_OFF
		message_label.custom_minimum_size.x = 0
