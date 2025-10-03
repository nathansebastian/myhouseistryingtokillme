extends Node2D
var velocity:Vector2 = Vector2.ZERO
var starting_position:Vector2 = Vector2.ZERO
func _process(_delta):
	queue_redraw()
func call_draw(_starting_postion,_velocity):
	starting_position = _starting_postion
	velocity = _velocity
func _draw():
	draw_line(starting_position,velocity,Color.LIME,8)
