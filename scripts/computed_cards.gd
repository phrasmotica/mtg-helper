@tool
class_name ComputedCards extends VBoxContainer

@export
var land_amount_labels := {}

var devotion_record: DevotionRecord
var land_count: int = 0

func _ready():
	update_lands()

func _on_devotion_counts_devotion_changed(dr: DevotionRecord):
	devotion_record = dr
	update_lands()

func _on_land_count_count_changed(count: int):
	land_count = count
	update_lands()

func update_lands():
	if not devotion_record:
		return

	for k in land_amount_labels.keys():
		var label: LandAmountLabel = get_node(land_amount_labels[k])

		var proportion := devotion_record.get_proportion(k)
		var amount = roundi(proportion * land_count)

		label.amount = amount
