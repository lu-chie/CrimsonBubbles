extends Node

# Chamando o kinematic body que é o model
onready var model = $".."

# Velocidades
export var walk_speed: float = 5.0  # Velocidade ao caminhar
export var run_speed: float = 10.0  # Velocidade ao correr

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Função de update movement que é chamada constantemente. Todo movimento é processado aqui.
# Feito assim para separar responsabilidades:
func update_movement(delta):
	# Reseta a velocidade horizontal
	model.velocity.x = 0
	model.velocity.z = 0



	# Aplica a gravidade se o personagem não estiver no chão
	if not model.is_on_floor():
		model.velocity.y += model.gravity * delta
	else:
		model.velocity.y = 0

	# Move o personagem
	model.move_and_slide(model.velocity, Vector3.UP)
	
func is_on_area():
	
	pass
