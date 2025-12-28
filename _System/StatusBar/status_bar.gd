extends PanelContainer

@onready var clock_timer: Timer = $ClockTimer
@onready var clock_label: Label = $ClockLabel

func _ready() -> void:
	GlobalClock.time_changed.connect(_update_time)
	_update_time(GlobalClock.current_hour, GlobalClock.current_minute)

func _update_time(hour: int, minute: int) -> void:
	clock_label.text = "%02d:%02d" % [hour, minute]
