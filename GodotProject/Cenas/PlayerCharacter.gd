extends KinematicBody

# Velocidade do personagem
export var speed: float = 5.0
# Gravidade
export var gravity: float = -9.8
# Vetor de movimento
var velocity: Vector3 = Vector3.ZERO

func _ready():
	pass

func _physics_process(delta: float):
	# Captura a direção de entrada do jogador
	var input_direction = Vector3.ZERO

	if Input.is_action_pressed("ui_up"):  # Seta para cima
		input_direction.z -= 1
	if Input.is_action_pressed("ui_down"):  # Seta para baixo
		input_direction.z += 1
	if Input.is_action_pressed("ui_left"):  # Seta para a esquerda
		input_direction.x -= 1
	if Input.is_action_pressed("ui_right"):  # Seta para a direita
		input_direction.x += 1

	# Normaliza o vetor de entrada para evitar velocidades inconsistentes
	if input_direction != Vector3.ZERO:
		input_direction = input_direction.normalized()

	# Define a velocidade horizontal (X e Z)
	velocity.x = input_direction.x * speed
	velocity.z = input_direction.z * speed

	# Aplica a gravidade no eixo Y
	velocity.y += gravity * delta

	# Move o personagem usando move_and_slide
	velocity = move_and_slide(velocity, Vector3.UP)
