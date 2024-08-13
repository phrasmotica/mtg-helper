@tool
class_name LandCount extends VBoxContainer

signal count_changed(count: int)

func _on_spin_box_value_changed(value: float):
	count_changed.emit(int(value))
