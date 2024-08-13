class_name DevotionRecord extends Resource

var devotion_amounts := {}

func set_amount(key: String, amount: int):
    devotion_amounts[key] = amount

func get_sum():
    return devotion_amounts.values().reduce(sum)

func sum(accum: int, num: int):
    return accum + num
