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

signal amount_changed(mana_key: String, amount: int)

func _ready():
	update_label(label_text)

func update_label(text: String):
	if label:
		label.text = text

func _on_button_spinner_amount_changed(amount: int):
	amount_changed.emit(mana_key, amount)
