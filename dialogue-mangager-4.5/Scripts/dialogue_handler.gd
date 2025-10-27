extends Node2D

@export var Balloon: PackedScene
@export var SmallBalloon: PackedScene
@export var title: String = "start"
@export var dialogue_resource: DialogueResource

var _player:Node2D
var is_small_window: bool = ProjectSettings.get_setting("display/window/size/viewport_width") < 400

func _ready():
	_player = Globals.player_node
	print(_player)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	await get_tree().create_timer(0.4).timeout

func _on_dialogue_ended(_resource: DialogueResource):
	_player.process_mode = Node.PROCESS_MODE_INHERIT
	await get_tree().create_timer(0.4).timeout
	# get_tree().quit()

func start_dialogue() -> void:
	DialogueManager.show_dialogue_balloon_scene(SmallBalloon if is_small_window else Balloon, dialogue_resource, title)
	_player.process_mode = Node.PROCESS_MODE_DISABLED
