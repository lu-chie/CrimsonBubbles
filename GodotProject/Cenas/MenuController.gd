extends Control

# Referências aos botões
onready var iniciar_button = $VBoxContainer/IniciarButton
onready var sair_button = $VBoxContainer/SairButton

func _ready():
	# Conectando os sinais "pressed" aos respectivos métodos
	iniciar_button.connect("pressed", self, "_on_iniciar_button_pressed")
	sair_button.connect("pressed", self, "_on_sair_button_pressed")

# Função para trocar a cena
func _on_iniciar_button_pressed():
	print("Botão Iniciar pressionado! Trocando de cena...")
	get_tree().change_scene("res://Cenas/Mundo.tscn")

# Função para sair do jogo
func _on_sair_button_pressed():
	print("Botão Sair pressionado! Fechando o jogo...")
	get_tree().quit()
