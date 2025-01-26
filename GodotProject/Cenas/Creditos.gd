extends Control

# Referências
onready var voltar_button = $VoltarButton
onready var background_music = $BackgroundMusic  # Referência ao nó de música

func _ready():
	# Conectando o botão Voltar ao método para retornar ao menu principal
	voltar_button.connect("pressed", self, "_on_voltar_button_pressed")
	
	# Tocar a música ao carregar a cena
	if background_music and not background_music.playing:
		background_music.play()

# Função para trocar para a cena do menu principal
func _on_voltar_button_pressed():
	print("Botão Voltar pressionado! Retornando ao menu principal...")
	_parar_musica()  # Parar a música antes de mudar de cena
	get_tree().change_scene("res://Cenas/MainMenuPrincipal.tscn")

# Função para parar a música
func _parar_musica():
	if background_music and background_music.playing:
		background_music.stop()
