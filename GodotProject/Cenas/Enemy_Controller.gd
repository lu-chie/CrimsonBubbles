extends Node

# Chamando o kinematic body que é o model
onready var model = $".."

# Velocidades
export var walk_speed: float = 5.0  # Velocidade ao caminhar
export var run_speed: float = 10.0  # Velocidade ao correr

var path = [] 
var target_position = Vector3()
var is_player_in : bool = false
onready var navmesh = $"../NavigationAgent"
var nav_atual = null
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Conecta o sinal body_entered à função _on_Area_body_entered
	connect("body_entered", self, "_on_Area_body_entered")
	# Conecta o sinal body_exited à função _on_Area_body_exited
	connect("body_exited", self, "_on_Area_body_exited")
	
	var nav_mesh_instances = find_nav_mesh_instances()
	
	if nav_mesh_instances:
		for instance in nav_mesh_instances:
			if instance:
				print("achou: "+ instance.name)
				nav_atual = instance  # Armazena a NavMesh encontrada
				break
			else:
				print("SemNavMesh")
	else:
		print("Nenhuma NavMesh encontrada na cena.")


func find_nav_mesh_instances():
	
	var instances = []
	var nodes_to_check = [get_tree().get_root()] 
	
	while nodes_to_check:
		var current_node = nodes_to_check.pop_back()
		
		if current_node is NavigationMeshInstance:
			instances.append(current_node)
		
		for child in current_node.get_children():
			nodes_to_check.append(child)
	
	return instances
	

# Função de update movement que é chamada constantemente. Todo movimento é processado aqui.
# Feito assim para separar responsabilidades:
func navegate(player: KinematicBody):
	
	if nav_atual and player:
		# Define o destino usando o método correto
		navmesh.set_target_location(player.global_transform.origin)
		var next_location = navmesh.get_next_location()
		var direction = (next_location - model.global_transform.origin).normalized()
		
		#var direction = (player.global_transform.origin).normalized()		
		model.velocity = direction * walk_speed
			
		if is_player_in == true:
			# Atualiza o destino continuamente
			navmesh.set_target_location(player.global_transform.origin)
			# Move o personagem
			model.move_and_slide(model.velocity, Vector3.UP)

func _on_Area_body_entered(body):
	if body is KinematicBody and body.name == "Player":
		is_player_in = true
		player = body
		print("player entrou")

func _on_Area_body_exited(body):
	if body is KinematicBody and body.name == "Player":
		is_player_in = false
		player = body
		print("player saiu")
