extends Control

@onready var inv: Inv = preload("res://Inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])

# Called when the node enters the scene tree for the first time.
func _ready():
	update_slots()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if !is_open:
			is_open = true
			$".".visible = true
		elif is_open:
			is_open = false
			$".".visible = false
		
