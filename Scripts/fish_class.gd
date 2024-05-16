class_name Fish extends Node2D

@export var type : String
@export var speed : int
@export var health : int
@export var rarity : int
@export var price : int

@onready var sprite = $Sprite2D
@onready var coll_shape = $Area2D/CollisionShape2D


func die():
	health = 0

## Called when the node enters the scene tree for the first time.
func _ready():
	sprite.scale.x = 0.3
	sprite.scale.y = 0.3
	
	if type == "BettaFish":
		speed = 100
		health = 100
		rarity = 10
		price = 500
		sprite.texture = preload("res://Assets/Sprites/Fish/pf big.png")
	
	if type == "ClownFish":
		speed = 200
		health = 200
		rarity = 5
		price = 150
		sprite.texture = preload("res://Assets/Sprites/Fish/nf big.png")
	
	if type == "HummingbirdTetra":
		speed = 100
		health = 100
		rarity = 7
		price = 200
		sprite.texture = preload("res://Assets/Sprites/Fish/pif big.png")

	if type == "GreenSunFish":
		speed = 65
		health = 300
		rarity = 3
		price = 90
		sprite.texture = preload("res://Assets/Sprites/Fish/gf right big.png")

	if type == "MaroonClownFish":
		speed = 100
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/orangright resized.png")

	if type == "Minnow":
		speed = 100
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/sf flipped big.png")

	if type == "RedSnapper":
		speed = 100
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/rf resized.png")

	if type == "TetraFish":
		speed = 100
		health = 100
		rarity = 8
		price = 250
		sprite.texture = preload("res://Assets/Sprites/Fish/rf flipped big.png")

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
