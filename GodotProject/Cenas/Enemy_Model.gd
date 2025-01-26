extends KinematicBody


# referenciando os scripts que compoem a arquitetura mvc da personagem
onready var enemy_controller = $Controller

export var speed: float = 15.0  # mostra a velocidade la no inspector, direita da viewport
var velocity: Vector3 = Vector3.ZERO  # velocidade atual da personagem sempre começa em 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	# toda a logica ta sendo feita la em contoller	
	if enemy_controller.is_player_in == false:
		enemy_controller.search()
	else:
		enemy_controller.navegate(enemy_controller.player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
