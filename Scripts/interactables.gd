extends Area2D
var self_index:int
var dist_between:float
var interact_icon:Node2D
@export var message_string:String

func _ready():
	interact_icon = get_node("Interact_Icon")
	interact_icon.visible = false


func _physics_process(_delta):
	for area in get_overlapping_areas():
		dist_between = global_position.distance_to(area.global_position)
		area.find_closest_area()

func _on_area_entered(area:Area2D):
	area.interactables_array.append(self)

func _on_area_exited(area:Area2D):
	area.interactables_array.erase(self)

func _message():
	print(message_string,self)
