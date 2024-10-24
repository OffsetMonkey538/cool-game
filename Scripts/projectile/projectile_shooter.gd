class_name ProjectileShooter extends Node2D

@export var shootSpeedSeconds: float = 1;
@export var projectileBaseCount: int = 1;
@export var projectileMultishotRangeDegrees: float = 20;
@export var projectileScene: PackedScene;

@onready var _projectileMultishotRangeRadians: float = deg_to_rad(projectileMultishotRangeDegrees);
@onready var _projectileMultishotRangeRadiansNegativeHalf: float = _projectileMultishotRangeRadians / -2;

func shootProjectiles():
	# TODO: multiply base count by some upgrade things once I implement upgrades
	var projectile_count: int = projectileBaseCount;
	
	for current_projectile in range(0, projectile_count):
		var projectile_rotation: float = _projectileMultishotRangeRadiansNegativeHalf + current_projectile * _projectileMultishotRangeRadians / projectile_count;
		shoot(projectile_rotation);

func shoot(rotation_offset: float):
	var new_projectile = projectileScene.instantiate();
	
	new_projectile.position = global_position;
	new_projectile.rotation = global_rotation + rotation_offset;
	
	LevelManager.current_scene.add_child(new_projectile);
