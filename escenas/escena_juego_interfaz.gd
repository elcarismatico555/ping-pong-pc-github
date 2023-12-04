extends Control

func _ready():
	$HBoxContainer1.visible = false
	$HBoxContainer2.visible = false
	habilitar_modo_score()

func _process(_delta):
	actualizar_interfaz()

func habilitar_modo_score():
	if Global.modo_score == 0:
		$HBoxContainer1.visible = true
	if Global.modo_score == 1:
		$HBoxContainer2.visible = true

func actualizar_interfaz():
	$HBoxContainer2/VBoxContainerP1/ProgressBarP1.value = Global.scoreP1
	$HBoxContainer2/VBoxContainerP2/ProgressBarP2.value = Global.scoreP2
	$HBoxContainer1/VBoxContainer2/ContadorP1.text = str(Global.scoreP1)
	$HBoxContainer1/VBoxContainer3/ContadorP2.text = str(Global.scoreP2)
	valor_cambiado_progress_bar1()
	valor_cambiado_progress_bar2()
	
func valor_cambiado_progress_bar1():
	if Global.scoreP1 == 10:
		Global.scoreP1 = 0
		$HBoxContainer2/VBoxContainerP1/ProgressBarP1.value = 0
		$escenaJuego/player1.modificar_shape("+")
		$escenaJuego/player2.modificar_shape("-")

func valor_cambiado_progress_bar2():
	if Global.scoreP2 == 10:
		Global.scoreP2 = 0
		$HBoxContainer2/VBoxContainerP2/ProgressBarP2.value = 0
		$escenaJuego/player2.modificar_shape("+")
		$escenaJuego/player1.modificar_shape("-")
