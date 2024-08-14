@tool
extends VBoxContainer

signal count_changed(count: int)

func _on_button_spinner_amount_changed(amount: int):
	count_changed.emit(amount)
