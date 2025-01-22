extends Node


# chamando o kinematic body q é o model
onready var model = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# funcao d update movement que ta sendo chamada em call, todo movimento é processado aca
# feito assim pra gente saber que se o problema é de movimento, ajeitar aqui
# se o problema for de parametro, ajeitar em model
#se o problema for de render, ajeitar em view

func update_movement(delta):
	
	# Reseta a velocidade horizontal
	model.velocity.x = 0
	model.velocity.z = 0

	if Input.is_action_pressed("ui_up"):
		model.velocity.z -= 1
	if Input.is_action_pressed("ui_down"):
		model.velocity.z += 1
	if Input.is_action_pressed("ui_left"):
		model.velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		model.velocity.x += 1

# aí antes esse codigo verificava as velocidades d x e de z, mas tem essa funcao legth que verifica o tamanho do vetor
# aí se o vetor for maior q (0.0,0.0,0.0) ele ja sabe q o bicho ta se movendo
# aí normaliza o vetor de velocidade (pra ter uma direção) e aplica ele multiplicado pela velocidade

	if model.velocity.length() > 0:
		model.velocity = model.velocity.normalized()
		
	if not model.is_on_floor():
		model.velocity.y += model.gravity * delta
	else:
		model.velocity.y = 0
	
	model.move_and_slide(model.velocity, Vector3.UP)
