extends MeshInstance

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player:
		look_at(player.global_transform.origin, Vector3.UP)
	pass


func _on_Area_body_entered(body):
	
	if body is KinematicBody and body.name == "Player":
		look_at(body.global_transform.origin, Vector3.UP)
		player = body
	pass # Replace with function body.
