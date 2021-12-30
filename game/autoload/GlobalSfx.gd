extends Node

#func music():
#	$OstMusic.play()




func _on_OstSong1_finished():
	$OstSong2.play()
