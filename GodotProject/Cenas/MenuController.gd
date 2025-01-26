extends Control

# Referências aos botões
onready var iniciar_button = $VBoxContainer/IniciarButton
onready var sair_button = $VBoxContainer/SairButton
onready var controles_button = $VBoxContainer/ControlesButton
onready var creditos_button = $VBoxContainer/CreditosButton
onready var background_music = $BackgroundMusic  # Referência ao nó de música

func _ready():
	# Conectando os sinais "pressed" aos respectivos métodos
	iniciar_button.connect("pressed", self, "_on_iniciar_button_pressed")
	sair_button.connect("pressed", self, "_on_sair_button_pressed")
	controles_button.connect("pressed", self, "_on_controles_button_pressed")
	creditos_button.connect("pressed", self, "_on_creditos_button_pressed")
	
	# Tocar a música ao iniciar
	if background_music and not background_music.playing:
		background_music.play()

# Função para trocar a cena - Iniciar
func _on_iniciar_button_pressed():
	print("Botão Iniciar pressionado! Trocando de cena...")
	_parar_musica()  # Para a música ao sair
	get_tree().change_scene("res://Cenas/Mundo.tscn")

# Função para trocar a cena - Créditos
func _on_creditos_button_pressed():
	print("Botão Créditos pressionado! Trocando de cena...")
	_parar_musica()  # Para a música ao sair
	get_tree().change_scene("res://Cenas/Creditos.tscn")

# Função para trocar a cena - Controles
func _on_controles_button_pressed():
	print("Botão Controles pressionado! Trocando de cena...")
	_parar_musica()  # Para a música ao sair
	get_tree().change_scene("res://Cenas/Controles.tscn")

# Função para sair do jogo
func _on_sair_button_pressed():
	print("Botão Sair pressionado! Fechando o jogo...")
	_parar_musica()
	get_tree().quit()

# Função para parar a música
func _parar_musica():
	if background_music and background_music.playing:
		background_music.stop()
