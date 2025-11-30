extends CharacterBody3D

@export var speed: float = 6.0
@export var rot_speed: float = 1.5

@onready var camera: Camera3D = $Camera

var yaw: float = 0.0


func _ready() -> void:
	# começa com a rotação atual do player
	yaw = rotation.y


func _physics_process(delta: float) -> void:
	rotacionar(delta)
	mover(delta)
	move_and_slide()


func rotacionar(delta: float) -> void:
	# gira o PLAYER (e a camera junto, porque ela é filha)
	if Input.is_action_pressed("ui_left"):
		yaw -= rot_speed * delta
	if Input.is_action_pressed("ui_right"):
		yaw += rot_speed * delta

	rotation.y = yaw


func mover(delta: float) -> void:
	var input_dir := Vector2.ZERO

	# CIMA = pra frente
	if Input.is_action_pressed("ui_up"):
		input_dir.y += 1.0

	# BAIXO = pra trás
	if Input.is_action_pressed("ui_down"):
		input_dir.y -= 1.0

	if input_dir == Vector2.ZERO:
		velocity.x = move_toward(velocity.x, 0.0, speed)
		velocity.z = move_toward(velocity.z, 0.0, speed)
		return

	input_dir = input_dir.normalized()

	# base do player (que tem mesma rotação Y da camera)
	var basis := global_transform.basis

	var forward := -basis.z
	forward.y = 0.0
	forward = forward.normalized()

	var right := basis.x
	right.y = 0.0
	right = right.normalized()

	# combina frente/trás relativo à direção do player/camera
	var move_dir := (forward * input_dir.y) + (right * input_dir.x)
	move_dir = move_dir.normalized()

	velocity.x = move_dir.x * speed
	velocity.z = move_dir.z * speed
