extends Control

#unc_ready() -> void:
	#or button in get_tree().get_nodes_in_group("button"):
		#utton.connect("pressed", self "on_button pressed", [button])
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func on_button_pressed(button: Button) -> void:
	match button.name:
		"iniciar":
			var _game: bool = get tree().change_scene("res://cenas/Cena-Teste.tscn"
			
