extends CharacterBody2D
@export var max_speed: int = 500
var speed: int = max_speed
signal on_interaction_pressed
func _ready():
	pass
	
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	if(Input.is_action_just_pressed("interaction")):
		on_interaction_pressed.emit()
