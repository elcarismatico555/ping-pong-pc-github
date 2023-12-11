extends Control

func _ready() -> void:
	$PanelMain/VBoxContainerOptions.visible = false
	$PanelMain/VBoxContainerMainMenu.visible = true
	Global.tipo_ball = %OptionButtonBall.get_selected_id()
	Global.modo_score = %OptionButtonScore.get_selected_id()
	Global.modo_players = %OptionButtonPlayers.get_selected_id()
	Global.tiempo_de_juego = %OptionButtonMinutos.get_selected_id()

# -- CAMBIO ESCENAS --

func _on_button_play_button_up() -> void:
	get_tree().change_scene_to_file("res://escenas/escena_juego.tscn")

func _on_button_exit_button_up() -> void:
	get_tree().quit()

func _on_button_options_button_up() -> void:
	$PanelMain/VBoxContainerMainMenu.visible = false
	$PanelMain/VBoxContainerOptions.visible = true

func _input(_event) -> void:
	if Input.is_action_just_released("ui_cancel"):
		if $PanelMain/VBoxContainerOptions.visible:
			$PanelMain/VBoxContainerOptions.visible = false
			$PanelMain/VBoxContainerMainMenu.visible = true

# -- BOTONES ITEM SELECCIONADO --

func _on_option_button_item_selected(index) -> void:
	Global.tipo_ball = index

func _on_option_button_2_item_selected(index) -> void:
	Global.modo_players = index

func _on_option_button_3_item_selected(index) -> void:
	Global.modo_score = index

func _on_option_button_minutos_item_selected(index) -> void:
	Global.tiempo_de_juego = index

func _on_option_button_cantidad_pelotas_item_selected(index) -> void:
	Global.cantidad_pelotas = %OptionButtonCantidadPelotas.get_item_id(index)

func _on_button_options_back_button_up() -> void:
	$PanelMain/VBoxContainerOptions.visible = false
	$PanelMain/VBoxContainerMainMenu.visible = true
