extends Node

signal time_changed(hour: int, minute: int)

var current_hour := 0
var current_minute := 0
var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	timer.one_shot = true
	timer.timeout.connect(_update_system_time)
	add_child(timer)
	
	_update_system_time()


func _update_system_time() -> void:
	var time := Time.get_time_dict_from_system()    
	current_hour = time.hour
	current_minute = time.minute
	time_changed.emit(current_hour, current_minute)
	
	var seconds_to_next_minute: float = 60 - time.second
	timer.start(seconds_to_next_minute)
