extends Resource

class_name Inv

signal update
@export var slots: Array[InvSlot]

func insert(item: InvItem):
	var item_slots = slots.filter(func(slot): return slot.item == item)
	if !item_slots.is_empty():
		item_slots[0].quantity += 1
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if !empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].quantity = 1
	update.emit()
	
#func move_inv(item: InvItem, inventory: Inv):
#	var item_ind = slots.find(item)
#	inventory.insert(slots[item_ind].item)
#	slots.remove_at(item_ind)
#	update.emit()  

