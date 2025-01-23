extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = $"../3DCharacter"
var is_player_in : bool = false

# Called when the node enters the scene tree for the first time.

func _ready():
	
	# area sera add ao grupo ao estar ready()
	add_to_group("focus_areas")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_Area_body_entered(body):
	if body is KinematicBody and body.name == "Player":  # Verifica se é o jogador
		#print(body.name + " entrou na área: " + name)
		is_player_in = true


func _on_Area_body_exited(body):
	if body is KinematicBody and body.name == "Player":  # Verifica se é o jogador
		#print(body.name + " saiu da área: " + name)
		is_player_in = false
