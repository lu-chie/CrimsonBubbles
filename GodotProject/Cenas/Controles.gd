extends Control

# Referência ao botão Voltar
onready var voltar_button = $VBoxContainer/Voltar

# Referência ao nó de música de fundo
onready var background_music = $BackgroundMusic

func _ready():
	# Iniciar a música de fundo, se o nó existir
	if background_music:
		background_music.play()
		print("Música de fundo iniciada.")

	# Conectando o botão Voltar ao método de retornar ao menu principal
	voltar_button.connect("pressed", self, "_on_voltar_button_pressed")

# Função para trocar para a cena do menu principal
func _on_voltar_button_pressed():
	print("Botão Voltar pressionado! Retornando ao menu principal...")
	get_tree().change_scene("res://cenas/MainMenuPrincipal.tscn")
