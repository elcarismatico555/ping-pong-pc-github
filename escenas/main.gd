extends Control

func _on_button_play_button_up():
	get_tree().change_scene_to_file("res://escenas/escena_juego.tscn")

func _on_button_exit_button_up():
	get_tree().quit()

func _on_button_options_button_up():
	$PanelMain/VBoxContainerMainMenu.visible = false
	$PanelMain/VBoxContainerOptions.visible = true

func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		if $PanelMain/VBoxContainerOptions.visible:
			$PanelMain/VBoxContainerOptions.visible = false
			$PanelMain/VBoxContainerMainMenu.visible = true

func _on_option_button_item_selected(index):
	Global.tipo_ball = index

func _on_option_button_2_item_selected(index):
	Global.modo_players = index

func _on_option_button_3_item_selected(index):
	Global.modo_score = index

func _on_button_options_back_button_up():
	$PanelMain/VBoxContainerOptions.visible = false
	$PanelMain/VBoxContainerMainMenu.visible = true
