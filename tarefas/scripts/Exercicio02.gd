extends Sprite2D

@export var textura_listras: Texture2D
@export var textura_pontos: Texture2D

@onready var shader_mat: ShaderMaterial = material


func _ready() -> void:
	if textura_listras != null:
		shader_mat.set_shader_parameter("pattern_tex", textura_listras)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_1:
			trocar_para_listras()
		elif event.keycode == KEY_2:
			trocar_para_pontos()


func trocar_para_listras() -> void:
	if textura_listras == null:
		return
	shader_mat.set_shader_parameter("pattern_tex", textura_listras)


func trocar_para_pontos() -> void:
	if textura_pontos == null:
		return
	shader_mat.set_shader_parameter("pattern_tex", textura_pontos)
