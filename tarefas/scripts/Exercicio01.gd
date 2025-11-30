extends Area2D

@export var raio: float = 80
@export var lados: int = 3
@export var estrela: bool = false
@export var textura: Texture2D

var poly: Polygon2D
var borda: Line2D
var rng := RandomNumberGenerator.new()

func _ready() -> void:
	poly = $Polygon2D
	borda = $Line2D
	rng.randomize()

	var pontos: PackedVector2Array = gerar_pontos()
	poly.polygon = pontos
	$CollisionPolygon2D.polygon = pontos

	configurar_textura()
	configurar_interpolacao()
	configurar_borda()


func gerar_pontos() -> PackedVector2Array:
	var pts := PackedVector2Array()

	if estrela:
		var ponta: float = raio
		var interno: float = raio * 0.45
		var total: int = 10
		for i in total:
			var ang: float = TAU * float(i) / float(total)
			var r: float = ponta if (i % 2 == 0) else interno
			var p := Vector2(cos(ang), sin(ang)) * r
			pts.append(p)
	else:
		for i in lados:
			var ang: float = TAU * float(i) / float(lados)
			var p := Vector2(cos(ang), sin(ang)) * raio
			pts.append(p)

	return pts


func configurar_textura() -> void:
	if textura == null:
		return
	poly.texture = textura
	poly.texture_scale = Vector2(0.25, 0.25)
	poly.color = Color.WHITE


func configurar_interpolacao() -> void:
	var cores := PackedColorArray()
	var n: int = poly.polygon.size()
	for i in n:
		var t: float = float(i) / max(1.0, float(n - 1))
		var c := Color(1.0, 0.3 + 0.7 * t, 0.2 + 0.5 * (1.0 - t))
		cores.append(c)
	poly.vertex_colors = cores


func configurar_borda() -> void:
	var pts: PackedVector2Array = poly.polygon
	var pts_fechados := PackedVector2Array(pts)
	pts_fechados.append(pts[0])

	borda.points = pts_fechados
	borda.width = 4.0
	borda.default_color = Color.BLACK


func _input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		trocar_cores()


func trocar_cores() -> void:
	var base := Color(rng.randf(), rng.randf(), rng.randf())

	var cores := PackedColorArray()
	var n: int = poly.polygon.size()
	for i in n:
		var t: float = float(i) / max(1.0, float(n - 1))
		var c := base.lightened(0.4 * t)
		cores.append(c)
	poly.vertex_colors = cores

	borda.default_color = base.darkened(0.4)
