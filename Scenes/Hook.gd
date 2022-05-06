extends Area2D

var timerFinished = false
var speed = 50
var screen_size = Vector2.ZERO
signal hit 
signal missed

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
	
	
func _process(delta):
	if timerFinished == true:
		position.y += speed * delta
		
		if Input.is_action_pressed("ui_right"):
			position.x += 1.5
		if Input.is_action_pressed("ui_left"):
			position.x -= 1.5
		if position.y > 990:
			emit_signal("missed")
			timerFinished = false
		

		
func start(new_position):
	position = new_position
	$CollisionShape2D.disabled = false


func _on_CastTimer_timeout():
	timerFinished = true



func _on_Hook_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")
