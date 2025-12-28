class_name SafeZoneContainer
extends MarginContainer

func _ready() -> void:
	_update_margins()
	get_viewport().size_changed.connect(_update_margins)

func _update_margins() -> void:
	var safe_rect := Rect2(DisplayServer.get_display_safe_area())
	var viewport_rect := get_viewport().get_visible_rect()
	
	# Convertir píxeles físicos del dispositivo a píxeles lógicos del juego
	# para compensar la alta densidad de las pantallas modernas
	var final_transform := get_viewport().get_final_transform()
	var safe_rect_local := safe_rect * final_transform.affine_inverse()
	
	# Calculo de márgenes
	var m_left := safe_rect_local.position.x - viewport_rect.position.x
	var m_top := safe_rect_local.position.y - viewport_rect.position.y
	var m_right := viewport_rect.end.x - safe_rect_local.end.x
	var m_bottom := viewport_rect.end.y - safe_rect_local.end.y
	
	# Aplica los overrides. 
	# Se usa max(0, valor) para evitar márgenes negativos si el cálculo falla por algún pixel.
	add_theme_constant_override("margin_left", maxi(0, roundi(m_left)))
	add_theme_constant_override("margin_top", maxi(0, roundi(m_top)))
	add_theme_constant_override("margin_right", maxi(0, roundi(m_right)))
	add_theme_constant_override("margin_bottom", maxi(0, roundi(m_bottom)))
