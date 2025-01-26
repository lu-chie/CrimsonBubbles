extends Spatial

# Referência ao nó de música
onready var background_music = $BackgroundMusic

func _ready():
	# Tocar a música ao carregar a cena
	if background_music and not background_music.playing:
		background_music.play()

func _exit_tree():
	# Parar a música quando sair da cena
	if background_music and background_music.playing:
		background_music.stop()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.func _ready(): # Replace with function bod


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
