extends Node2D

var score = 0


func new_game():
	score = 0
	$HUD.update_score(score)
	

