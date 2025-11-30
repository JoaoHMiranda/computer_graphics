extends CharacterBody3D

@export var speed: float = 6.0
@export var rot_speed: float = 1.5

@onready var camera: Camera3D = $Camera

var yaw: float = 0.0


func _ready() -> void:
	yaw = rotation.y


func _physics_process(delta: float) -> void:
	rotacionar(delta)
	mover()
	move_and_slide()


func rotacionar(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		yaw -= rot_speed * delta
	if Input.is_action_pressed("ui_right"):
		yaw += rot_speed * delta

	rotation.y = yaw


func mover() -> void:
	var input_dir := Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		input_dir.y += 1.0

	if Input.is_action_pressed("ui_down"):
		input_dir.y -= 1.0

	if input_dir == Vector2.ZERO:
		velocity.x = move_toward(velocity.x, 0.0, speed)
		velocity.z = move_toward(velocity.z, 0.0, speed)
		return

	input_dir = input_dir.normalized()

	var player_basis := global_transform.basis

	var forward := -player_basis.z
	forward.y = 0.0
	forward = forward.normalized()

	var right := player_basis.x
	right.y = 0.0
	right = right.normalized()

	var move_dir := (forward * input_dir.y) + (right * input_dir.x)
	move_dir = move_dir.normalized()

	velocity.x = move_dir.x * speed
	velocity.z = move_dir.z * speed
