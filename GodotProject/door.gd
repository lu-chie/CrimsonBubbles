extends Area

export(String, FILE, "*.tscn") var target_scene_path
export(NodePath) var spawn_point_path
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_Area_body_entered(body):
	if body is KinematicBody and (body.name == "Player" or body.name == "Enemy"):
		move_player_to_spawn(body)
	
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("doors")
	pass # Replace with function body.

func move_player_to_spawn(player):
	if spawn_point_path:
		var spawn_point = get_node(spawn_point_path)
		if spawn_point:
			player.global_transform.origin = spawn_point.global_transform.origin
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



