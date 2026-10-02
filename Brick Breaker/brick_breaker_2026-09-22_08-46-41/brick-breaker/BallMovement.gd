extends RigidBody2D

@export var verticalSpeed = 0;  
@export var horizontalSpeed = 0; 
@export var dir = 1;

var initialHorizontalSpeed = 0; 
var initialVerticalSpeed = 0;  
var firstCollision = false  


func _ready():  
	initialHorizontalSpeed = horizontalSpeed  
	initialVerticalSpeed = verticalSpeed  
	pass



func _physics_process(delta):  
	if (firstCollision == false):  
		horizontalSpeed = 0  
		
	var collision = move_and_collide(Vector2(horizontalSpeed * delta, verticalSpeed * -dir * delta))  
  
	if (collision):  
		firstCollision = true  
		var colliderName = collision.get_collider().name  
  
		if (colliderName == "Player"):  
			dir = 1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed, initialHorizontalSpeed) 
			
		if (colliderName == "Top Wall"):  
			dir = -1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed, initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  
  
		if (colliderName == "Bottom Wall"):  
			dir = 1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed, initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  
  
		if (colliderName == "Left Wall"):  
			dir = 1  
			horizontalSpeed = randi_range(initialHorizontalSpeed / 1.3, initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  
  
		if (colliderName == "Right Wall"):  
			dir = 1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed / 1.3, -initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  
 
	pass  
