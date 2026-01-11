class_name NotificationBanner
extends MarginContainer

@onready var icon_rect: TextureRect = %IconRect
@onready var title_label: Label = %TitleLabel
@onready var content_label: Label = %ContentLabel
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer

func show_notification(data: NotificationData) -> void:
	title_label.text = data.title
	content_label.text = data.content
	
	if data.icon:
		icon_rect.texture = data.icon
		icon_rect.show()
	else:
		icon_rect.hide()
	
	if data.sound:
		audio_stream_player.stream = data.sound
		audio_stream_player.play()
	
	var tween := create_tween()
	tween.tween_property(self, "position:y", 60.0, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_interval(data.duration)
	tween.tween_property(self, "position:y", -150.0, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
