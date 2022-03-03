extends Control

var text_explain = ["THEY EVEN BEHAVE LIKE OTHER RODENTS",
	"CAPYBARAS ARE FANTASTIC SWIMMERS",
	"THEY CAN EVEN SLEEP IN WATER", "THEY’RE ALSO EXTREMELY AGILE ON LAND",
	"ADULT CAPYBARA WEIGHS AS MUCH AS AN ADULT HUMAN"]

var rng_text
var rng_sprite
var create = true

onready var sprites = $ColorRect/Complete/Sprites

func _ready():
	sprite_disabled()

# warning-ignore:unused_argument
func _process(_delta):
	rng_text= int(rand_range(0,text_explain.size()))
	rng_sprite= int(rand_range(0,sprites.get_child_count()))
	actual_screen()
	continue_game()

func actual_screen():
	if create:
		sprites.get_node("Sprite"+str(rng_sprite)).visible = true
		$Panel/TextExplain.text= text_explain[rng_text]
		create= false

func sprite_disabled():
	for i in $ColorRect/Complete/Sprites.get_children():
		i.visible=false


func continue_game():
	if Input.is_action_pressed("ui_accept"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://game/Levels/Level"+str(DataPlayer.next_lvl)+".tscn")

