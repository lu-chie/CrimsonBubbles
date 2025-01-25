extends Spatial

onready var camera = $Camera
onready var cam_collider = $SpringArm

export(float) var max_length = 20.0
export(float) var min_length = 2.0
export(float) var smooth_speed = 0.1

var target_position: Vector3

func focus(delta):

	for area in get_tree().get_nodes_in_group("focus_areas"):
		if area.is_player_in == true:  # Verifica se o jogador está dentro da área
			#print(area.name)
			target_position = area.global_transform.origin
			position = target_position
			break  # Sai do loop após encontrar a primeira área válida

func _ready():
	pass

func _process(delta):
	
	focus(delta)

func adjust_camera_distance(delta):
	
	var distancia = cam_collider.collision_point()
	# Verifica se o SpringArm está colidindo com algo
	if cam_collider.is_colliding():
		print(distancia)
		# Reduz a distância da câmera até a distância mínima
		cam_collider.spring_length = max(cam_collider.spring_length - smooth_speed * delta, min_length)
	else:
		# Aumenta a distância da câmera até a distância máxima
		cam_collider.spring_length = min(cam_collider.spring_length + smooth_speed * delta, max_length)
