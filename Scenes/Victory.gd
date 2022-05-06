extends Area2D

signal victory

func _on_Victory_body_entered(body):
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("victory")

