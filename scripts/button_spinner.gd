@tool
extends PanelContainer

@export
var maximum: int = 50

@onready
var amount_label: Label = %AmountLabel

var amount: int = 0:
	set(value):
		var new_value = clampi(value, 0, maximum)
		if amount == new_value:
			return

		amount = new_value

		if amount_label:
			amount_label.text = str(amount)

		amount_changed.emit(amount)

signal amount_changed(amount: int)

func _on_minus_button_pressed():
	amount -= 1

func _on_minus_button_ten_pressed():
	amount -= 10

func _on_plus_button_pressed():
	amount += 1

func _on_plus_button_ten_pressed():
	amount += 10
