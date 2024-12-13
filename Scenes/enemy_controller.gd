extends CharacterBody2D
var alert:bool = false
var speed:int = 1
var vector_normal: Vector2 = Vector2.ZERO
@export var receiver_node_name:String = ""

func _process(_delta):
	var direction: Vector2 = (Globals.player_position - position).normalized() 
	velocity = direction * speed
	if alert:
		var _drawline = get_node("DrawLine")
		var pos_b = get_node("PointB")
		vector_normal = Vector2.ZERO.direction_to(pos_b.position)
		print(vector_normal)
		_drawline.call_draw(Vector2.ZERO,pos_b.position)
		look_at(Globals.player_position)
		move_and_collide(velocity)

func _on_alert_box_body_entered(body:Node2D):
	print(body)
	alert = true

func _on_alert_box_body_exited(_body:Node2D):
	alert = false

func _on_attack_area_body_entered(body:Node2D):
	if body.has_node(receiver_node_name):
		var _receiver = body.get_node(receiver_node_name)
		_receiver.on_called(self)

