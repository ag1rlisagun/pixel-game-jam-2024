extends Node2D

@export var type : String
@export var price : int

@onready var collect = $"."
@onready var sprite = $Sprite2D
@onready var coll_shape = $Area2D/CollisionShape2D

var is_diving = false # add for shopping and inventory
var player_entered = false
	
func _on_area_2d_body_entered(body):
	if body.has_method("player"): 
		player_entered = true
		# show prompt 'e' to catch/collect
		
func _on_area_2d_body_exited(body):
	if body.has_method("player"): 
		player_entered = false
			
func _process(delta):
	if player_entered:
		if Input.is_action_just_pressed("action"):
			collect.visible = false
			queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	# create differentiation for collectibles appearance when it's in
	# the diving scene, inventory ot shop
	is_diving = get_tree().get_current_scene().scene_file_path == "res://Scenes/Game Scenes/diving_scene.tscn"
	
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
		
	if type == "Gold Coin": 
		if is_diving:
			coll_shape.scale.x = 3
			coll_shape.scale.y = 3
		else:
			coll_shape.scale.x = 6
			coll_shape.scale.y = 6
		price = 500 # randonmly generate a value (not always the same)
		sprite.texture = preload("res://Assets/Sprites/Fish/gf right big.png") #put the sprite here

