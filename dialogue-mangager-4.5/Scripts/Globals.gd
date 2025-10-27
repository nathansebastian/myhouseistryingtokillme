extends Node

var player_position: Vector2
var player_node: Node2D
var player_health = 10:
	set(value):
		player_health = value
		player_health = limit_value(player_health,10)
		
func limit_value(arg1:int, _max:int) -> int:
	if(arg1 > _max):
		arg1 = _max
	return arg1

