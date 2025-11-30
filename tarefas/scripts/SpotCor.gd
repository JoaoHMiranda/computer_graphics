extends SpotLight3D

@export var cores: Array[Color] = [
	Color.WHITE,
	Color.RED,
	Color.GREEN,
	Color.BLUE,
	Color.YELLOW
]

var indice: int = 0


func _ready() -> void:
	light_color = cores[indice]


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		mudar_cor()


func mudar_cor() -> void:
	indice = (indice + 1) % cores.size()
	light_color = cores[indice]
