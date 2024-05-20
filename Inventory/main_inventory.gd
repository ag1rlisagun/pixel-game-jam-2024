extends Control

@export var inv: Inv 
@export var fish_inv: Inv
@export var decor_inv: Inv
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func load_data():
	if FileAccess.file_exists("res://SaveData/little_oannes_play_inv.tres"):
		inv = load("res://SaveData/little_oannes_play_inv.tres")
		inv.update.connect(update_slots)
		update_slots()
	else:
		inv = load("res://Inventory/player_inventory.tres")
		inv.update.connect(update_slots)
		update_slots()
	if FileAccess.file_exists("res://SaveData/little_oannes_fish_inv.tres"):
		fish_inv = load("res://SaveData/little_oannes_fish_inv.tres")
	else:
		fish_inv = load("res://Inventory/fish_tank_fish_inventory.tres")
	if FileAccess.file_exists("res://SaveData/little_oannes_decor_inv.tres"):
		decor_inv = load("res://SaveData/little_oannes_decor_inv.tres")
	else:
		decor_inv = load("res://Inventory/decor_fish_tank_inventory.tres")

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
#	setup_slot_signals()

#func setup_slot_signals():
#	for i in range(inv.slots.size()): 
#		var slot_ui = $NinePatchRect/GridContainer.get_child(i)
#		slot_ui.connect("slot_clicked", on_slot_pressed)
		
#func on_slot_pressed(slot_index):
#	var slot = inv.slots[slot_index]
#	var item = slot.item
#	if item != null:
#		handle_item_interaction(item)
		
#func handle_item_interaction(item):
#	# Implement your logic for interacting with the item
#	print("Item clicked: " + item.name)
#	fish_inv.insert(item)
	
	# inv.move_inv(item, fish_inv)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if !is_open:
			is_open = true
			$".".visible = true
		elif is_open:
			is_open = false
			$".".visible = false

