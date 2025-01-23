extends KinematicBody

# Variáveis
export var velocidade = 3.0
var player_detectado = false
var player_posicao = Vector3.ZERO

# Referências
onready var mesh = $MeshInstance
onready var area = $Area
# onready var audio = $AudioStreamPlayer3D

# Chamado quando o nó entra na cena
func _ready():
	# Desativa a visibilidade do inimigo no início
	mesh.visible = false
	# Conecta o sinal de detecção
	area.connect("body_entered", self, "_on_area_entered")

# Função chamada quando o jogador entra na área de detecção
func _on_area_entered(body):
	if body.name == "..":  # Certifique-se de que o nó do jogador se chama "Player"
		player_detectado = true
		mesh.visible = true  # Torna o inimigo visível
		player_posicao = body.global_transform.origin
		#if audio:
		#	audio.play()  # Reproduz o som ao aparecer

# Movimento do inimigo
func _physics_process(delta):
	if player_detectado:
		# Perseguir o jogador
		var direcao = (player_posicao - global_transform.origin).normalized()
		var movimento = direcao * velocidade
		move_and_slide(movimento)
