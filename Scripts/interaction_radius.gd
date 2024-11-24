extends Area2D
var within_area:bool = false
# var dist_bet:float
var object_area:Area2D
var closest_interactable
@export var interactables_array:Array[Area2D] = []
var interactables_distances:Array[float]

func find_closest_area():
	interactables_distances.clear()
	for area in interactables_array:
		interactables_distances.append(area.dist_between)
	var closest_array = interactables_distances	
	closest_array.sort()
	var closest
	for i in interactables_array.size():
		if (closest_array[0] == interactables_array[i].dist_between):
			closest = interactables_array[i]
	closest_interactable = closest
	activate_interact_icon()
func _physics_process(_delta):
	if get_overlapping_areas().is_empty()&& closest_interactable !=null:
		closest_interactable.interact_icon.visible = false

func activate_interact_icon():
	for interactable_ in interactables_array:
		if interactable_ == closest_interactable:
			interactable_.interact_icon.visible = true
		else:
			interactable_.interact_icon.visible = false

func disable_activity():
	for interactable_ in interactables_array:
			interactable_.interact_icon.visible = false

func _on_player_on_interaction_pressed():
	if(closest_interactable!= null):
		closest_interactable._message()
