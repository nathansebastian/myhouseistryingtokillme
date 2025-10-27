extends CharacterBody2D
var speed: int = 10
var direction:Vector2
var additional_force:Vector2 = Vector2.ZERO


signal on_interaction_pressed
signal player_died
var collision_data:KinematicCollision2D
var has_collided:bool = false
	
func _init():
	Globals.player_node = self

func _process(_delta):
	direction = Input.get_vector("left","right","up","down")
	Globals.player_position = global_position
	if(Input.is_action_just_pressed("interaction")):
		on_interaction_pressed.emit()

func _physics_process(_delta):
	velocity = (direction * speed + additional_force) 	
	# print(velocity)
	var _collision_data = move_and_collide(velocity)
	if(_collision_data):
		collision_data =_collision_data
		has_collided = true	
	# print(additional_force)

func hit(_sender):
	# print("hit!")
	var _health:int = Globals.player_health
	# _health -= 1
	if(_health <= 0):
		queue_free()
		player_died.emit()
	damage_taken_indicator()	
	Globals.player_health = _health
	if(collision_data):
		print(velocity)
		print(collision_data.get_normal())
		additional_force += collision_data.get_normal() *20
		print("global_position",global_position)
		var _drawline = get_node("DrawLine")
		_drawline.call_draw(Vector2.ZERO,collision_data.get_normal()*400)
		await get_tree().create_timer(.2).timeout
		additional_force =Vector2.ZERO
		has_collided = false
	speed = 6 
	await get_tree().create_timer(.5).timeout
	speed = 10

func damage_taken_indicator() -> void:
	$Sprite2D.material.set_shader_parameter("_alpha",0.6)
	await get_tree().create_timer(0.15).timeout
	$Sprite2D.material.set_shader_parameter("_alpha",0)
