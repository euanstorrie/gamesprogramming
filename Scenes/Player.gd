extends KinematicBody2D

var velocity = Vector2(0, 0)

var gravity = 1000
var max_gravity = 2000
var scene_class = load("res://Scenes/PlatforMinigame.tscn")
var unlocked = false

func start(new_position):
	position = new_position
	$CollisionShape2D.disabled = false
	
func _physics_process(delta):
	
	if Input.is_action_just_pressed("move"):
		unlocked = true

	if unlocked == true:
		if Input.is_action_pressed("ui_left"):
			velocity.x = -150
			
		elif Input.is_action_pressed("ui_right"):
			velocity.x = 150
		
		else:
			velocity.x = 0
			
		if Input.is_action_just_pressed("ui_select") and is_on_floor():
			velocity.y = -330
		
		velocity.y += gravity * delta
		if velocity.y >max_gravity:
			velocity.y = max_gravity
			
		
		if is_on_floor() and velocity.y > 0:
			velocity.y = 0
			
		velocity = move_and_slide(velocity, Vector2(0, -1))

func _input(event):
	if event.is_action_pressed("cast"):
		get_node("FishermanIdle").play("fish")
		
	

