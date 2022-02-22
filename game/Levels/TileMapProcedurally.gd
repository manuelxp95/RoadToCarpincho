extends TileMap


export var width = 39
export var height = 35
export var amountRoad = 1
export var amountEnemys = 0
export var level_number = "1"
export var next_level = "Sample"

var margin = 7
var yOffset
var vehicle= preload("res://game/vehicle/VehicleBase.tscn")
var gaucho= preload("res://game/enemy/Gaucho.tscn")
var rng = RandomNumberGenerator.new()
var all_vehicles = []
var beetween_cars= true
var path_level


onready var winPoint = $LakeWin
onready var t_environment = $TileMapEnvio


func _ready() -> void:
	
	#-------------------Initialice
	
	path_level = "/root/Level"+level_number
	yOffset= height-margin
	winPoint.next_lvl=next_level
	
	#-------------------Functions
	
	make_back_black()
	amount_road()
	make_zonewin()
	spawn_gaucho()


func _process(_delta):
	rng = RandomNumberGenerator.new()
	spawn_loop()


#------------------- Functions to set procedurally

func make_back_black():
	for x in width:
		for y in height:
			var rng_x= rng.randi_range(0,7)
			var rng_y= rng.randi_range(0,7)
			set_cell(x,y,6,false,false,false,Vector2(rng_x,rng_y)) #6 is the tile name, for this case the grass


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
	get_node(path_level+"/Vehicles").call_deferred("add_child", new_vehicle)
	new_vehicle.create(Vector2(700,y),dir,new_speed) #this position should be random
	all_vehicles.append([Vector2(700,y),dir,new_speed])


func spawn_loop():
	if beetween_cars:
		for car in all_vehicles:
			var new_vehicle= vehicle.instance()
			get_node(path_level+"/Vehicles").call_deferred("add_child", new_vehicle)
			new_vehicle.create(car[0],car[1],car[2])
		beetween_cars=false
		$Timer.start()


	#----------------- Position for win zone


func make_zonewin():
	for x in width:
		for y in 10:
			var rng_x= rng.randi_range(0,8)
			var rng_y= rng.randi_range(0,5)
			set_cell(x,-y,5,false,false,false,Vector2(rng_x,rng_y))
	winPoint.position.x = (width/2)*16
	winPoint.position.y = -20


#----------------------------------
func spawn_gaucho():
	var i = 1
	while i <= amountEnemys:
		var rng_x= rand_range(1,width-1)
		var rng_y= rand_range(margin,yOffset)
		if get_cell(rng_x,rng_y) == 6:
			var new_enemy = gaucho.instance()
			get_node(path_level+"/Enemys").call_deferred("add_child", new_enemy)
			new_enemy.create(Vector2(rng_x*16,rng_y*16))
			i +=1



#RESET ALL SCENE
func _input(event:InputEvent) ->void:
	if event.is_action_pressed("reset") and DataPlayer.lifes != 0:
		DataPlayer.score -= 50


func reload_map()->void:
	get_tree().reload_current_scene()

func _on_Timer_timeout():
	beetween_cars=true
