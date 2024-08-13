@tool
extends VBoxContainer

@export
var devotion_inputs: Array[DevotionSpinBox] = []

@onready
var total_amount_label: Label = %TotalAmountLabel

var devotion_amounts := {}

func _ready():
	for i in devotion_inputs:
		i.amount_changed.connect(update_total)

func update_total(mana_key: String, new_amount: int):
	devotion_amounts[mana_key] = new_amount

	total_amount_label.text = str(devotion_amounts.values().reduce(sum))

func sum(accum: int, num: int):
	return accum + num
