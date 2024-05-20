extends Panel

@onready var item_display: Sprite2D = $CenterContainer/Panel/ItemDisplay
@onready var item_quantity_text = $Quantity
var item_name: String = ""
var is_diving = false
var player_interact = false

@export var inv: Inv
@export var fish_tank_inv: Inv
@export var decor_inv: Inv
@export var slot_index: int

	#signal slot_clicked(slot_index)

func update(slot: InvSlot):
	if !slot.item:
		item_display.visible = false
		item_quantity_text.visible = false
		
	elif slot.item:
		item_display.visible = true
		item_display.texture = slot.item.texture
		item_display.scale.x = 0.1
		item_display.scale.y = 0.1
		# $CollectAttributes.text = slot.item.name
		if slot.quantity > 1:
			item_quantity_text.text = str(slot.quantity)
			item_quantity_text.visible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	is_diving = get_tree().get_current_scene().scene_file_path == "res://Scenes/Game Scenes/diving_scene.tscn"
	# connect("slot_clicked", on_slot_clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	# $CollectAttributes.visible = true
	pass

func _on_mouse_exited():
	# $CollectAttributes.visible = false
	pass

#func _on_gui_input(event):
#	if event is InputEventMouseButton and (event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT) and event.is_pressed():
#		# on_slot_clicked(slot_index)
#		emit_signal("slot_clicked", slot_index)


#func on_slot_clicked(slot_index):
#	emit_signal("slot_clicked", slot_index)
#	print("On slot CLICKED!")
