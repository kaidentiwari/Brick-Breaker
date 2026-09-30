extends RigidBody2D

@export var verticalSpeed = 0;  
@export var horizontalSpeed = 0; 
@export var dir = 1;
@export var loseScreen = Node;
@export var player = Node;

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
	var playerDir = Input.get_axis("ui_right", "ui_left")
  
	if (collision):  
		firstCollision = true  
		var colliderName = collision.get_collider().name  
		horizontalSpeed = abs(horizontalSpeed) * playerDir  

		if (colliderName == "Obstacle"):  
			collision.get_collider().queue_free()
			dir = -1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed, initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  

		if (colliderName == "Player"):  
			dir = 1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed, initialHorizontalSpeed) 
			
		if (colliderName == "Top Wall"):  
			dir = -1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed, initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  
  
		if (colliderName == "Lose Hitbox"):  
			loseScreen.show()
			self.queue_free()
			player.ChangePlayerState()
			
		if (colliderName == "Left Wall"):  
			dir = 1  
			horizontalSpeed = randi_range(initialHorizontalSpeed / 1.3, initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  
  
		if (colliderName == "Right Wall"):  
			dir = 1  
			horizontalSpeed = randi_range(-initialHorizontalSpeed / 1.3, -initialHorizontalSpeed)  
			verticalSpeed = randi_range(initialVerticalSpeed / 1.3, initialVerticalSpeed * 2)  
 
	pass  
