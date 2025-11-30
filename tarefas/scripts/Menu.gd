extends Control

func _on_botao_iniciar_pressed() -> void:
	# abre a cena 3D do cubo
	get_tree().change_scene_to_file("res://Exercício 04.tscn")

func _on_botao_opcoes_pressed() -> void:
	# por enquanto só uma mensagem (depois tu pode abrir outra cena)
	print("Tela de opções ainda em construção :)")
	
func _on_sair_pressed() -> void:
	# fecha o jogo / fecha a janela
	get_tree().quit()
