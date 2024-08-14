@tool
class_name DevotionSpinBox extends HBoxContainer

@export
var label_text := "":
	set(value):
		label_text = value

		update_label(value)

@export
var mana_key := ""

@onready
var label: Label = %Label

@onready
var spin_box: SpinBox = %SpinBox

@onready
var amount_label: Label = %AmountLabel

# TODO: use the appropriate mana pip as the slider handle icon
@onready
var slider: Slider = %HSlider

signal amount_changed(mana_key: String, amount: int)

func _ready():
	update_label(label_text)

func update_label(text: String):
	if label:
		label.text = text

func _on_spin_box_value_changed(value: float):
	amount_changed.emit(mana_key, int(value))

func _on_h_slider_value_changed(value: float):
	amount_label.text = str(int(value))

	amount_changed.emit(mana_key, int(value))
