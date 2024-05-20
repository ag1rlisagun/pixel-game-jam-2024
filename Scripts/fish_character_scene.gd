class_name Fish 
extends CharacterBody2D

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

@export var item: InvItem
@export var inv: Inv

var current_state = IDLE
var dir = Vector2.RIGHT

@export var type : String
@export var speed : int
@export var health : int
@export var max_health : int
@export var rarity : int
@export var price : int

@onready var fish = $"."
@onready var fish_name = $FishName
@onready var fish_attributes = $FishAttributes
@onready var sprite = $Sprite2D
@onready var coll_shape1 = $Area2D/CollisionShape2D
@onready var coll_shape2 = $CollisionShape2D

var player_entered = false
var is_diving = false
var in_tank = false

# FIGURE OUT HEALTH THAT DEPLETES AND SAVES

func choose(array):
#	print("Shuffling Array...")
	array.shuffle()
	return array.front()

func _on_area_2d_mouse_entered():
	fish_name.visible = true 
	fish_attributes.visible = true 

func _on_area_2d_mouse_exited():
	fish_name.visible = false 
	fish_attributes.visible = false 
	
func _on_area_2d_body_entered(body):
	if body.has_method("player"): 
		player_entered = true
		# show prompt 'e' to catch/collect
		
func _on_area_2d_body_exited(body):
	if body.has_method("player"): 
		player_entered = false
		
func move(delta):
#	print("Moving ")
	position += dir * speed * delta
	if dir.x == 1:
		sprite.flip_h = false
	elif dir.x == -1:
		sprite.flip_h = true
			
func _process(delta):
	match current_state:
		IDLE:
			pass
		MOVE:
			move(delta)
		NEW_DIR:
			dir = choose([Vector2.RIGHT, Vector2.LEFT])

	if player_entered:
		if Input.is_action_just_pressed("action"):
			fish.visible = false
			collect(item)
			queue_free()
			
	move_and_slide()

func _on_timer_timeout():
#	print("Getting new timer wait time...")
	$Timer.wait_time = choose([0.75, 1, 1.5])
	
#	print("Choosing a new state...")
	current_state = choose([IDLE, NEW_DIR, MOVE])

func die():
	health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
#	print("Randomizing...")
	randomize()
	
	in_tank = get_tree().get_current_scene().scene_file_path == "res://Scenes/Game Scenes/fish_tank_scene.tscn"
	is_diving = get_tree().get_current_scene().scene_file_path == "res://Scenes/Game Scenes/diving_scene.tscn"
#	print("Getting type of fish...")
	
	if is_diving:
		sprite.scale.x = 0.1
		sprite.scale.y = 0.1
		get_node("FishName").set("theme_override_font_sizes/font_size", 11);
		get_node("FishAttributes").set("theme_override_font_sizes/font_size", 8);
		
	else:
		sprite.scale.x = 0.3
		sprite.scale.y = 0.3
		get_node("FishName").set("theme_override_font_sizes/font_size", 22);
		get_node("FishAttributes").set("theme_override_font_sizes/font_size", 18);
		
	if type == "Betta Fish":
		item = preload("res://Inventory/Items/betta_fish.tres")
		if is_diving:
			coll_shape1.scale.x = 3.5
			coll_shape1.scale.y = 3.5
			coll_shape2.scale.x = 2.5
			coll_shape2.scale.y = 2.5
			speed = 200
		else:
			coll_shape1.scale.x = 6.5
			coll_shape1.scale.y = 6.5
			coll_shape2.scale.x = 5.5
			coll_shape2.scale.y = 5.5
			speed = 100
		max_health = 100
		health = 100
		rarity = 10
		price = 500
		sprite.texture = preload("res://Assets/Sprites/Fish/pf big.png")
	
	if type == "Clownfish":
		item = preload("res://Inventory/Items/clownfish.tres")
		if is_diving:
			coll_shape1.scale.x = 3
			coll_shape1.scale.y = 3
			coll_shape2.scale.x = 2
			coll_shape2.scale.y = 2
			speed = 400
		else:
			coll_shape1.scale.x = 5.5
			coll_shape1.scale.y = 5.5
			coll_shape2.scale.x = 4.5
			coll_shape2.scale.y = 4.5
			speed = 200
		max_health = 200
		health = 200
		rarity = 5
		price = 150
		sprite.texture = preload("res://Assets/Sprites/Fish/nf big.png")
	
	if type == "Hummingbird Tetra":
		item = preload("res://Inventory/Items/humming.tres")
		if is_diving:
			coll_shape1.scale.x = 2.5
			coll_shape1.scale.y = 2.5
			coll_shape2.scale.x = 1.5
			coll_shape2.scale.y = 1.5
			speed = 200
		else:
			coll_shape1.scale.x = 4.5
			coll_shape1.scale.y = 4.5
			coll_shape2.scale.x = 3.5
			coll_shape2.scale.y = 3.5
			speed = 100
		max_health = 100
		health = 100
		rarity = 7
		price = 200
		sprite.texture = preload("res://Assets/Sprites/Fish/pif big.png")

	if type == "Green Sunfish":
		item = preload("res://Inventory/Items/green.tres")
		if is_diving:
			coll_shape1.scale.x = 4
			coll_shape1.scale.y = 4
			coll_shape2.scale.x = 3
			coll_shape2.scale.y = 3
			speed = 130
		else:
			coll_shape1.scale.x = 7.5
			coll_shape1.scale.y = 7.5
			coll_shape2.scale.x = 6.5
			coll_shape2.scale.y = 6.5
			speed = 65
		max_health = 300
		health = 300
		rarity = 3
		price = 90
		sprite.texture = preload("res://Assets/Sprites/Fish/gf right big.png")

	if type == "Maroon Clownfish":
		item = preload("res://Inventory/Items/maroon.tres")
		if is_diving:
			coll_shape1.scale.x = 2
			coll_shape1.scale.y = 2
			coll_shape2.scale.x = 1
			coll_shape2.scale.y = 1
			speed = 200
		else:
			coll_shape1.scale.x = 3.5
			coll_shape1.scale.y = 3.5
			coll_shape2.scale.x = 2.5
			coll_shape2.scale.y = 2.5
			speed = 100
		max_health = 300
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/orangright resized.png")

	if type == "Minnow":
		item = preload("res://Inventory/Items/minnow.tres")
		if is_diving:
			coll_shape1.scale.x = 2
			coll_shape1.scale.y = 2
			coll_shape2.scale.x = 1
			coll_shape2.scale.y = 1
			speed = 200
		else:
			coll_shape1.scale.x = 3.5
			coll_shape1.scale.y = 3.5
			coll_shape2.scale.x = 2.5
			coll_shape2.scale.y = 2.5
			speed = 100
		max_health = 300
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/sf flipped big.png")

	if type == "Red Snapper":
		item = preload("res://Inventory/Items/red.tres")
		if is_diving:
			coll_shape1.scale.x = 3.5
			coll_shape1.scale.y = 3.5
			coll_shape2.scale.x = 2.5
			coll_shape2.scale.y = 2.5
			speed = 200
		else:
			coll_shape1.scale.x = 6.5
			coll_shape1.scale.y = 6.5
			coll_shape2.scale.x = 5.5
			coll_shape2.scale.y = 5.5
			speed = 100
		max_health = 300
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/rf resized.png")

	if type == "Tetra Fish":
		item = preload("res://Inventory/Items/tetra.tres")
		if is_diving:
			coll_shape1.scale.x = 3
			coll_shape1.scale.y = 3
			coll_shape2.scale.x = 2
			coll_shape2.scale.y = 2
			speed = 200
		else:
			coll_shape1.scale.x = 5.5
			coll_shape1.scale.y = 5.5
			coll_shape2.scale.x = 4.5
			coll_shape2.scale.y = 4.5
			speed = 100
		max_health = 300
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/rf flipped big.png")
	
	fish_name.text = type
	fish_attributes.text = "Health: " + str(health) + "/" + str(health) + "\n" + " Rarity: " + str(rarity) + "/10"

func collect(item1):
	inv.insert(item1)
	print("Caught " + item.name)
