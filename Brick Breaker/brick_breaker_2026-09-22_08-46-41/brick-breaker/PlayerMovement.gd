extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	var dir = Input.get_axis("ui_right", "ui_left")
	move_and_collide(Vector2(dir * SPEED * delta, 0))
