extends Node2D

signal game_over
var lives = 3

func _ready():
	randomize()
	$Player.velocity.y = 0
	$CanvasLayer/ButtonStart.hide()
	$CanvasLayer/LabelTitle.percent_visible = 0
	$CanvasLayer/ButtonHowTo.hide()
	$CanvasLayer/LabelInfo.percent_visible = 1
	
	get_tree().call_group("fish", "queue_free")
	
	

func _input(event):
	if event.is_action_pressed("cast"):
		$CastTimer.start()
		$CanvasLayer/LabelInfo.percent_visible = 0
		$FishTimer.start()
		


func _on_CastTimer_timeout():
	$Hook.start($Position2D.position)
	$Hook.visible = true
	$Hook/Camera2D.current = true
	$CanvasLayer/LabelMissed.visible = false


func _on_FishTimer_timeout():
	var fish_spawn_location = $FishSpawn/FishSpawnLocation
	fish_spawn_location.unit_offset = randf()
	
	var fish = preload("res://Scenes/Fish.tscn").instance()
	add_child(fish)
	
	fish.scale.y = 0.5
	
	fish.position = fish_spawn_location.position
	
	var direction = fish_spawn_location.rotation 
	direction += 45
	fish.rotation = direction
	
	var velocity = Vector2(rand_range(fish.min_speed, fish.max_speed), 0)
	fish.linear_velocity = velocity.rotated(direction)
	


func _on_Hook_hit():
	get_tree().change_scene("res://Scenes/PlatforMinigame.tscn")
	



func _on_Hook_missed():
	
	$Hook.start($Position2D.position)
	lives = lives - 1
	$CanvasLayer/LabelLives.text = "Lives: " + str(lives)
	$CanvasLayer/LabelMissed.visible = true
	if lives == 0:
		emit_signal("game_over")



func _on_Level_game_over():
	$Player.visible = false
	$CanvasLayer/ButtonQuit.visible = true
	$CanvasLayer/LabelGameOver.visible = true
