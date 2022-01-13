extends Node

var current_song = 1

func slowmusic():
	var slow_song = "OstSong" + str(current_song)
	var ost_current= get_node(slow_song)
	ost_current.pitch_scale = 0.5

func normalmusic():
	var slow_song = "OstSong" + str(current_song)
	var ost_current= get_node(slow_song)
	ost_current.pitch_scale = 1.0

func _on_OstSong1_finished():
	current_song=2
	$OstSong2.play()


func _on_OstSong2_finished():
	current_song=3
	$OstSong3.play()


func _on_OstSong3_finished():
	current_song=4
	$OstSong4.play()


func _on_OstSong4_finished():
	current_song=1
	$OstSong1.play()
