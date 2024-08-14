@tool
class_name ComputedCards extends VBoxContainer

@export
var land_amount_labels := {}

@onready
var excess_label: Label = %ExcessLabel

var devotion_record: DevotionRecord
var land_count: int = 0

var total_lands: int = 0:
	set(value):
		total_lands = value

		if total_lands < land_count:
			excess_label.text = "+" + str(land_count - total_lands) + " remaining"
			excess_label.show()
		else:
			excess_label.hide()

func _ready():
	update_lands()

	excess_label.hide()

func _on_devotion_counts_devotion_changed(dr: DevotionRecord):
	devotion_record = dr
	update_lands()

func _on_land_count_count_changed(count: int):
	land_count = count
	update_lands()

func update_lands():
	if not devotion_record:
		return

	var computed_lands := 0

	for k in land_amount_labels.keys():
		var label: LandAmountLabel = get_node(land_amount_labels[k])

		var proportion := devotion_record.get_proportion(k)
		var amount = roundi(proportion * land_count)

		label.amount = amount

		computed_lands += amount

	total_lands = computed_lands
