extends RigidBody2D

export var min_speed = 130
export var max_speed = 150
onready var Player = get_parent().get_node("Player")
var movement = true
var velocity = Vector2(0, 0)
var gravity = 1000
var max_gravity = 2000

func start(new_position):
	position = new_position
	
func _process(delta):
	if movement == true:
		if Player.position.x < position.x:
			velocity.x = -150
			
		elif Player.position.x < position.x:
			velocity.x = 150
		
		else:
			velocity.x = 0
			
#		if Input.is_action_just_pressed("ui_select"):
#			velocity.y = -200
#
		velocity.y += gravity * delta
		if velocity.y >max_gravity:
			velocity.y = max_gravity
			
		
		if  velocity.y > 0:
			velocity.y = 0
			
		

func _ready():
	$AnimatedSprite.playing = true
	var fish_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = fish_types[randi() % fish_types.size()]
	
	$AnimatedSprite.flip_v = false
	
	if $AnimatedSprite.animation == "Anglie":
		$AnglieCollisionShape2D.disabled = false
		$CarpieCollisionShape2D.disabled = true
		$FlattieCollisionShape2D.disabled = true
		$GoldieCollisionShape2D.disabled = true
		$MantieStripeSharkieCollisionShape2D.disabled = true
		$SharpieCollisionShape2D.disabled = true
		
	if $AnimatedSprite.animation == "Carpie":
		$AnglieCollisionShape2D.disabled = true
		$CarpieCollisionShape2D.disabled = false
		$FlattieCollisionShape2D.disabled = true
		$GoldieCollisionShape2D.disabled = true
		$MantieStripeSharkieCollisionShape2D.disabled = true
		$SharpieCollisionShape2D.disabled = true
		
	if $AnimatedSprite.animation == "Flattie":
		$AnglieCollisionShape2D.disabled = true
		$CarpieCollisionShape2D.disabled = true
		$FlattieCollisionShape2D.disabled = false
		$GoldieCollisionShape2D.disabled = true
		$MantieStripeSharkieCollisionShape2D.disabled = true
		$SharpieCollisionShape2D.disabled = true
		
	if $AnimatedSprite.animation == "Goldie":
		$AnglieCollisionShape2D.disabled = true
		$CarpieCollisionShape2D.disabled = true
		$FlattieCollisionShape2D.disabled = true
		$GoldieCollisionShape2D.disabled = false
		$MantieStripeSharkieCollisionShape2D.disabled = true
		$SharpieCollisionShape2D.disabled = true
		
	if $AnimatedSprite.animation == "Mantie":
		$AnglieCollisionShape2D.disabled = true
		$CarpieCollisionShape2D.disabled = true
		$FlattieCollisionShape2D.disabled = true
		$GoldieCollisionShape2D.disabled = true
		$MantieStripeSharkieCollisionShape2D.disabled = false
		$SharpieCollisionShape2D.disabled = true
		
	if $AnimatedSprite.animation == "Stripie":
		$AnglieCollisionShape2D.disabled = true
		$CarpieCollisionShape2D.disabled = true
		$FlattieCollisionShape2D.disabled = true
		$GoldieCollisionShape2D.disabled = true
		$MantieStripeSharkieCollisionShape2D.disabled = false
		$SharpieCollisionShape2D.disabled = true
		
	if $AnimatedSprite.animation == "Sharkie":
		$AnglieCollisionShape2D.disabled = true
		$CarpieCollisionShape2D.disabled = true
		$FlattieCollisionShape2D.disabled = true
		$GoldieCollisionShape2D.disabled = true
		$MantieStripeSharkieCollisionShape2D.disabled = false
		$SharpieCollisionShape2D.disabled = true
		
	if $AnimatedSprite.animation == "Sharpie":
		$AnglieCollisionShape2D.disabled = true
		$CarpieCollisionShape2D.disabled = true
		$FlattieCollisionShape2D.disabled = true
		$GoldieCollisionShape2D.disabled = true
		$MantieStripeSharkieCollisionShape2D.disabled = true
		$SharpieCollisionShape2D.disabled = false


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	




func _on_PlatforMinigame_swim():
	position.x =+ 1.5
