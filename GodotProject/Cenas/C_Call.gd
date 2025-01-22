extends KinematicBody


# referenciando os scripts que compoem a arquitetura mvc da personagem
onready var controller = $Controller
onready var view = $View

export var speed: float = 15.0  # mostra a velocidade la no inspector, direita da viewport
export var gravity: float = -8.8 # gravidade
var velocity: Vector3 = Vector3.ZERO  # velocidade atual da personagem sempre começa em 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# toda a logica ta sendo feita la em contoller
	controller.update_movement(delta)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
