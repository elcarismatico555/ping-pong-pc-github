extends Control

func _ready():
	$HBoxContainer1/VBoxContainer2/ContadorP1.text = str(Global.scoreP1)
	$HBoxContainer1/VBoxContainer3/ContadorP2.text = str(Global.scoreP2)
	$HBoxContainer1/VBoxContainer1/NumeroRonda.text = "0"

func _process(_delta):
	actualizar_interfaz()

func actualizar_interfaz():
	$HBoxContainer1/VBoxContainer2/ContadorP1.text = str(Global.scoreP1)
	$HBoxContainer1/VBoxContainer3/ContadorP2.text = str(Global.scoreP2)
	$HBoxContainer1/VBoxContainer1/NumeroRonda.text = str(Global.ultima_colision_pelota)
