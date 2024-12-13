extends Node2D
var ending_position:Vector2 = Vector2.ZERO
var starting_position:Vector2 = Vector2.ZERO
func _process(_delta):
	queue_redraw()
func call_draw(_starting_postion,_ending_position):
	starting_position = _starting_postion
	ending_position = _ending_position
func _draw():
	draw_line(starting_position,ending_position,Color.LIME,8)


