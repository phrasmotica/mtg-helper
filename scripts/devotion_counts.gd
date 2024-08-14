@tool
extends VBoxContainer

@export
var devotion_inputs: Array[DevotionInput] = []

@onready
var total_amount_label: Label = %TotalAmountLabel

var devotion_record: DevotionRecord

signal devotion_changed(devotion_record: DevotionRecord)

func _ready():
	for i in devotion_inputs:
		i.amount_changed.connect(update_total)

	devotion_record = DevotionRecord.new()

func update_total(mana_key: String, new_amount: int):
	devotion_record.set_amount(mana_key, new_amount)

	total_amount_label.text = str(devotion_record.get_sum())

	devotion_changed.emit(devotion_record)
