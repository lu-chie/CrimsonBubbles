extends Control

# Referências aos botões
onready var iniciar_button = $VBoxContainer/IniciarButton
onready var sair_button = $VBoxContainer/SairButton
onready var controles_button = $VBoxContainer/ControlesButton
onready var creditos_button = $VBoxContainer/CreditosButton

# Referência ao áudio de fundo
onready var background_music = $BackgroundMusic

func _ready():
	# Iniciar a música de fundo em loop
	if background_music:
		background_music.play()
	
	# Conectando os sinais "pressed" aos respectivos métodos
	iniciar_button.connect("pressed", self, "_on_iniciar_button_pressed")
	controles_button.connect("pressed", self, "_on_controles_button_pressed")
	creditos_button.connect("pressed", self, "_on_creditos_button_pressed")
	sair_button.connect("pressed", self, "_on_sair_button_pressed")
	
	print("Conexões de sinais realizadas com sucesso!")

# Função para trocar a cena - Iniciar
func _on_iniciar_button_pressed():
	print("Botão Iniciar pressionado! Trocando de cena...")
	get_tree().change_scene("res://cenas/Mundo.tscn")

# Função para trocar a cena - Controles
func _on_controles_button_pressed():
	print("Botão Controles pressionado! Trocando de cena...")
	get_tree().change_scene("res://cenas/Controles.tscn")

# Função para trocar a cena - Créditos
func _on_creditos_button_pressed():
	print("Botão Créditos pressionado! Trocando de cena...")
	get_tree().change_scene("res://cenas/Créditos.tscn")

# Função para sair do jogo
func _on_sair_button_pressed():
	print("Botão Sair pressionado! Fechando o jogo...")
	get_tree().quit()
