extends RigidBody3D

var sideinput: float
@export var side_speed: float
@export var jump_power: float
@onready var grounded_ray: RayCast3D = $RayCast3D


func _physics_process(_delta: float) -> void:
	move()
	if Input.is_action_just_pressed("up") and is_grounded():
		jump()
	

func move() -> void:
	sideinput = Input.get_axis("left", "right")
	var sidemov: Vector3 = Vector3(0,0, -sideinput)
	apply_torque(sidemov * side_speed)

func jump() -> void:
	apply_impulse(Vector3.UP * jump_power)
	

func is_grounded() -> bool:
	var gp = grounded_ray.global_position
	var tp = gp + Vector3.DOWN * 0.6
	grounded_ray.target_position = grounded_ray.to_local(tp)
	grounded_ray.force_raycast_update()
	
	if grounded_ray.is_colliding():
		return true
	return false 
	
