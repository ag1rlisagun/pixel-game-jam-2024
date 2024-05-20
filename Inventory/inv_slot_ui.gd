extends Panel

@onready var item_display: Sprite2D = $CenterContainer/Panel/ItemDisplay
@onready var item_quantity_text = $Quantity
var item_name: String = ""

func update(slot: InvSlot):
	if !slot.item:
		item_display.visible = false
		item_quantity_text.visible = false
		
	elif slot.item:
		item_display.visible = true
		item_display.texture = slot.item.texture
		item_display.scale.x = 0.1
		item_display.scale.y = 0.1
		$CollectAttributes.text = slot.item.name
		if slot.quantity > 1:
			item_quantity_text.text = str(slot.quantity)
			item_quantity_text.visible = true
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	$CollectAttributes.visible = true

func _on_mouse_exited():
	$CollectAttributes.visible = false
