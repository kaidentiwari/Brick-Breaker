extends Node2D  
  
@export var loseText: Label  
@export var loseScreen: Node  
@export var player: Node  
  
func _ready():  
	start()  # starts the 67-second countdown  
  
func _process(_delta):  
	loseText.text = str(int(time_left)) + " seconds left"  
  
	if time_left <= 0.0:  
		stop()  
		loseScreen.show()  
		player.changePlayerState()  
