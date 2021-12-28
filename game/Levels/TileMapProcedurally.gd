extends TileMap


export var width = 39
export var height = 35
export var amountRoad = 1

var margin = 7
var yOffset= height-margin
#var yOffset= rand_range(margin,height-margin)
var vehicle= preload("res://game/vehicle/VehicleBase.tscn")
var rng = RandomNumberGenerator.new()
var all_vehicles = []
var beetween_cars= true


onready var winPoint = $LakeWin
onready var t_environment = $TileMapEnvio


func _ready() -> void:
	make_back_black()
	amount_road()
	make_zonewin()


func _process(_delta):
	spawn_loop()


#------------------- Functions to set procedurally

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
		t_environment.set_cell(x,yOffsetSpace+1,-1)
		t_environment.set_cell(x,yOffsetSpace,-1)  
		set_cell(x,yOffsetSpace,2) 
	make_a_vehicle(yOffsetSpace*16)


func make_a_vehicle(y):
	var new_vehicle= vehicle.instance()
	var dir = rng.randi_range(0,1)
	var rng_speed= rand_range(-300,-60)
	var new_speed=Vector2(rng_speed,0)
	get_node("/root/LevelSample/Vehicles").call_deferred("add_child", new_vehicle)
	new_vehicle.create(Vector2(700,y),dir,new_speed) #this position should be random
	all_vehicles.append([Vector2(700,y),dir,new_speed])


func spawn_loop():
	if beetween_cars:
		for car in all_vehicles:
			var new_vehicle= vehicle.instance()
			get_node("/root/LevelSample/Vehicles").call_deferred("add_child", new_vehicle)
			new_vehicle.create(car[0],car[1],car[2])
		beetween_cars=false
		$Timer.start()


	#----------------- Position for win zone


func make_zonewin():
	for x in width:
		for y in 10:
			set_cell(x,-y,1)
	winPoint.position.x = (width/2)*16
	winPoint.position.y = -20

#RESET ALL SCENE
func _input(event:InputEvent) ->void:
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()


func _on_Timer_timeout():
	beetween_cars=true
