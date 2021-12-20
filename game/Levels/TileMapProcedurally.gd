extends TileMap

var width = 39
var height = 30
var margin = 5
var yOffset= rand_range(margin,height-margin)
var vehicle= preload("res://game/vehicle/VehicleBase.tscn")
var rng = RandomNumberGenerator.new()

export var amountRoad = 1

func _ready() -> void:
	make_back_black()
	amount_road()


func _process(_delta):
	pass


func make_back_black():
	for x in width:
		for y in height:
			set_cell(x,y,0) #0 is the tile name


func amount_road():
	var yOffsetSpace= yOffset
	for i in amountRoad:
		var nRand= rand_range(3,9)
		make_a_road(yOffsetSpace)
		if yOffsetSpace-nRand < 0: #space beetween the roads
			yOffsetSpace += nRand
		else:
			yOffsetSpace -= nRand


func make_a_road(yOffsetSpace):
	for x in width:
		set_cell(x,yOffsetSpace+1,-1) 
		set_cell(x,yOffsetSpace,2) 
	make_a_vehicle(yOffsetSpace*16)


func make_a_vehicle(y):
	var new_vehicle= vehicle.instance()
	var dir = rng.randi_range(0,1)
	get_node("/root/LevelSample/Vehicles").call_deferred("add_child", new_vehicle)
	new_vehicle.create(Vector2(700,y),dir) #this position should be random

#RESET ALL SCENE
func _input(event:InputEvent) ->void:
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
