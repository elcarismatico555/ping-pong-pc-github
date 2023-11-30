extends Control

func _ready():
	$HBoxContainer/VBoxContainer2/ContadorP1.text = str(Global.scoreP1)
	$HBoxContainer/VBoxContainer3/ContadorP2.text = str(Global.scoreP2)
	$HBoxContainer/VBoxContainer/NumeroRonda.text = "0"

func _process(_delta):
	actualizar_interfaz()

func actualizar_interfaz():
	$HBoxContainer/VBoxContainer2/ContadorP1.text = str(Global.scoreP1)
	$HBoxContainer/VBoxContainer3/ContadorP2.text = str(Global.scoreP2)
	$HBoxContainer/VBoxContainer/NumeroRonda.text = str(Global.ultima_colision_pelota)
