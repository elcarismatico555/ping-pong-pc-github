extends Control

func _ready() -> void:
	Global.scoreP1 = 0
	Global.scoreP2 = 0
	Global.valor_barra_P1 = 0
	Global.valor_barra_P2 = 0
	$PantallaTiempoFinalizado.visible = false
	$HBoxContainer1.visible = true
	tiempo_juego()

func _process(_delta) -> void:
	var tiempo = int($HBoxContainer1/VBoxContainer1/tiempo/Timer.time_left)
	$HBoxContainer1/VBoxContainer1/tiempo.text = str(tiempo)
	$HBoxContainer1/VBoxContainer1/tiempo.text = str(tiempo)
	habilitar_modo_score()

func actualiza_modo_score_clasico():
	$HBoxContainer1/VBoxContainer2/ContadorP1.text = str(Global.scoreP1)
	$HBoxContainer1/VBoxContainer3/ContadorP2.text = str(Global.scoreP2)

func actualizar_modo_score_barra():
	$HBoxContainer1/VBoxContainer2/ProgressBarP1.value = Global.valor_barra_P1
	$HBoxContainer1/VBoxContainer3/ProgressBarP2.value = Global.valor_barra_P2
	cambiar_valor_progress_bar1()
	cambiar_valor_progress_bar2()

#region -- Temporizador en partida --

func tiempo_juego() -> void:
	if Global.tiempo_de_juego != 0:
		Global.tiempo_de_juego *= 60
		$HBoxContainer1.visible = true
		$HBoxContainer1/VBoxContainer1/tiempo.visible = true
		$HBoxContainer1/VBoxContainer1/tiempo/Timer.start(Global.tiempo_de_juego)
	else:
		$HBoxContainer1/VBoxContainer1/tiempo.visible = false

func _on_timer_timeout() -> void:
	$PantallaTiempoFinalizado.visible = true
	if Global.scoreP1 > Global.scoreP2:
		$PantallaTiempoFinalizado/VBoxContainerTiempoFinalizado/JugadorGanador.text = "Player 1"
	else:
		$PantallaTiempoFinalizado/VBoxContainerTiempoFinalizado/JugadorGanador.text = "Player 2"
	%LabelScoreP1.text = str(Global.scoreP1)
	%LabelScoreP2.text = str(Global.scoreP2)
# -- endregion --

func habilitar_modo_score() -> void:
	if Global.modo_score == 0:
		actualiza_modo_score_clasico()
		$HBoxContainer1/VBoxContainer2/ProgressBarP1.visible = false
		$HBoxContainer1/VBoxContainer3/ProgressBarP2.visible = false
	if Global.modo_score == 1:
		actualiza_modo_score_clasico()
		actualizar_modo_score_barra()
	
func cambiar_valor_progress_bar1() -> void:
	if Global.valor_barra_P1 == 10:
		$HBoxContainer1/VBoxContainer2/ProgressBarP1.value = 0
		$escenaJuego/player1.modificar_shape("+")
		$escenaJuego/player2.modificar_shape("-")

func cambiar_valor_progress_bar2() -> void:
	if Global.valor_barra_P2 == 10:
		$HBoxContainer1/VBoxContainer3/ProgressBarP2.value = 0
		$escenaJuego/player2.modificar_shape("+")
		$escenaJuego/player1.modificar_shape("-")

func _on_progress_bar_p_1_value_changed(value) -> void:
	Global.valor_barra_P1 = value

func _on_progress_bar_p_2_value_changed(value) -> void:
	Global.valor_barra_P2 = value
