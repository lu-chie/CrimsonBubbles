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

	# Verifica as teclas de direção
	if Input.is_action_pressed("ui_up"):
		model.velocity.z -= 1
	if Input.is_action_pressed("ui_down"):
		model.velocity.z += 1
	if Input.is_action_pressed("ui_left"):
		model.velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		model.velocity.x += 1

	# Verifica se o personagem está correndo (Shift pressionado)
	var current_speed = walk_speed
	if Input.is_action_pressed("ui_shift"):  # Shift pressionado
		current_speed = run_speed

	# Normaliza o vetor de velocidade (para direção) e aplica a velocidade
	if model.velocity.length() > 0:
		model.velocity = model.velocity.normalized() * current_speed

	# Aplica a gravidade se o personagem não estiver no chão
	if not model.is_on_floor():
		model.velocity.y += model.gravity * delta
	else:
		model.velocity.y = 0

	# Move o personagem
	model.move_and_slide(model.velocity, Vector3.UP)
