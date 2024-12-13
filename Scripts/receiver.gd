extends Node
@export var func_name:String = ""
var func_callable:Callable

func _ready():
	if func_name:
		func_callable = Callable(get_parent(),func_name)

func on_called(sender):
	print("sent from "+sender.name)
	if func_name:
		func_callable.call(sender)
