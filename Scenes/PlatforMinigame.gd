extends Node2D

signal swim
var timerFinished

func _on_VsTimer_timeout():
	$Player.get_node("FishermanIdle").play("run")
	$Player.start($Player/PlayerPosition.position)
	$Fish.start($Fish/Position2D.position)
	$LabelVS.hide()
	$LabelInfo.show()
	$StaticBody2D.show()
	$StaticBody2D2.show()
	$StaticBody2D3.show()
	$StaticBody2D4.show()
	$StaticBody2D5.show()
	$StaticBody2D6.show()
	emit_signal("swim")

func _on_VictoryTimer_timeout():
	var timerFinished = true
	
func _on_Victory_victory():
	$VictoryTimer.start()
	$LabelV.show()
	$"/root/global".score = $"/root/global".score  + 1
	get_tree().change_scene("res://Scenes/Level.tscn")


