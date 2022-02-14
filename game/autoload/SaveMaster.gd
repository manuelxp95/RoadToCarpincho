extends Node

const SAVE_DIR = "user://saves/"

var save_path= SAVE_DIR + "save.dat"

var data =[]

func _ready():
	load_data()

func load_data():
	var file = File.new()
	if not file.file_exists(SaveMaster.save_path):
	# CREATE SAVE.DATA
		var dir = Directory.new()
		if !dir.dir_exists(SAVE_DIR):
			dir.make_dir_recursive(SAVE_DIR)
		var error = file.open(save_path, File.WRITE)
		if error == OK:
			data=[["AAAA", 0000],["AABB", 0000],["AACC", 0000],["MANU", 0001]]
			file.store_var(data)
	else:
		file.open(save_path,File.READ)
		data= file.get_var()
	file.close()


#save data
func save_data():
	var file=File.new()
	file.open(save_path,File.WRITE)
	file.store_var(data)
	file.close()


#Reorder if score is higher
func new_score(new_name,score):
	for i in data.size():
		if score > (data[i])[1]:
			var cont = 3
			for j in 3-i:
				if cont >= 0:
					data[i+cont] = data[i+cont-1]
					cont -= 1
			data[i]=[new_name,score]
		save_data()
		break

