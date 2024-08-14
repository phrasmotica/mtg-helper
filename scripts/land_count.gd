@tool
class_name LandCount extends VBoxContainer

@onready
var amount_label: Label = %AmountLabel

signal count_changed(count: int)

func _on_spin_box_value_changed(value: float):
	count_changed.emit(int(value))

func _on_h_slider_value_changed(value: float):
	amount_label.text = str(int(value))

	count_changed.emit(int(value))
