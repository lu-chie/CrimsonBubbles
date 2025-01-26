extends KinematicBody

# Variáveis
export var velocidade = 10.0
export var area_aleatoria_min = Vector3(-100, 0, -100)  # Posição mínima para o teleporte
export var area_aleatoria_max = Vector3(100, 0, 100)  # Posição máxima para o teleporte
var player_detectado = false
var player_posicao = Vector3.ZERO

# Referências
onready var mesh = $MeshInstance
onready var area = $Area
onready var audio = $AudioStreamPlayer3D

# Chamado quando o nó entra na cena
func _ready():
	# Desativa a visibilidade do inimigo no início
	mesh.visible = false
	# Conecta o sinal de detecção
	area.connect("body_entered", self, "_on_area_entered")
	area.connect("body_exited", self, "_on_area_exited")

# Função chamada quando o jogador entra na área de detecção
func _on_area_entered(body:Node):
	var bodyname = body.name
	if body.name == "Player":  # Certifique-se de que o nó do jogador se chama "3DCharacter"
		player_detectado = true
		mesh.visible = true  # Torna o inimigo visível
		player_posicao = body.global_transform.origin
		# Se quiser tocar um som ao aparecer
		if audio:
		   audio.play()

# Função chamada quando o jogador sai da área de detecção
func _on_area_exited(body):
	if body.name == "Player":  # Quando o jogador sai da área
		player_detectado = false
		mesh.visible = false  # Torna o inimigo invisível
		teleport_randomly()  # Teleporta o inimigo para uma posição aleatória
		if audio and audio.playing:
			audio.stop()

# Movimento do inimigo
func _physics_process(delta):
	if player_detectado:
		# Perseguir o jogador
		var direcao = (player_posicao - global_transform.origin).normalized()
		var movimento = direcao * velocidade
		move_and_slide(movimento)

# Função para teleportar o inimigo para uma posição aleatória
func teleport_randomly():
	var random_position = Vector3(
		rand_range(area_aleatoria_min.x, area_aleatoria_max.x),
		0,  # Assume que o inimigo deve ficar no chão (ajuste conforme a altura)
		rand_range(area_aleatoria_min.z, area_aleatoria_max.z)
	)
	global_transform.origin = random_position



func _on_area_area_entered(area):
	pass # Replace with function body.


func _on_area_area_exited(area):
	pass # Replace with function body.
