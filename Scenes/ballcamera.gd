extends Camera3D


@export var Target: RigidBody3D
@export var followdistance: float

func _physics_process(_delta: float) -> void:
	position = Target.position
	position.z = followdistance
