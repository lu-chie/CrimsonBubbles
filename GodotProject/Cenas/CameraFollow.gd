extends Camera

# Referência para o jogador
onready var player = $"/root/Path/To/.."

# Velocidade de suavização do movimento da câmera
export var smoothing_speed = 5.0

# Posição relativa desejada da câmera em relação ao jogador
export var offset = Vector3(0, 5, -10)

func _process(delta):
	if player:
		# Posição alvo da câmera
		var target_position = player.global_transform.origin + offset
		# Interpolação suave para mover a câmera
		global_transform.origin = global_transform.origin.linear_interpolate(target_position, smoothing_speed * delta)

