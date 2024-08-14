class_name DevotionRecord extends Resource

var devotion_amounts := {}

func set_amount(key: String, amount: int):
    devotion_amounts[key] = amount

func get_proportion(key: String) -> float:
    if not devotion_amounts.has(key):
        return 0

    var amount: int = devotion_amounts[key]
    var total := get_sum()

    return amount / float(total)

func get_sum() -> int:
    return devotion_amounts.values().reduce(sum)

func sum(accum: int, num: int):
    return accum + num
