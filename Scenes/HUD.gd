extends CanvasLayer

signal start_game

func update_score():
	$LabelScore.text = "Score: " + str($"/root/global".score)
	
func update_lives():
	$LabelLives.text = "Lives: " + str($"/root/global".lives)
	
func _process(delta):
	update_score()
func _on_ButtonStart_pressed():
	get_tree().change_scene("res://Scenes/Level.tscn")
	$ButtonStart.hide()
	$ButtonHowTo.hide()
	$LabelTitle.hide()
	$LabelInfo.percent_visible = 1
