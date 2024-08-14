@tool
class_name LandAmountLabel extends HBoxContainer

@export
var amount: int = 0:
	set(value):
		if value >= 0:
			amount = value

			update_text()

@export
var land_name := "":
	set(value):
		land_name = value

		update_text()

@onready
var label: Label = %Label

func _ready():
	update_text()

func update_text():
	if label:
		label.text = str(amount) + "x " + land_name
