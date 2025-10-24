extends CharacterBody2D

@export var speed = 100
var idle_time = 0.0

@onready var animated_sprite = $AnimatedSprite2D
## Might not need the collision shape to be shortcut,
## but it's good to have easily available
#@onready var collision_shape = $CollisionShape2D

func _ready():
	pass

func _physics_process(delta: float):
	velocity = Vector2.ZERO
	if (Input.is_action_pressed ("move_right") ):
		velocity.x += 1
	if (Input.is_action_pressed ("move_left") ):
		velocity.x -= 1
	if (Input.is_action_pressed ("move_up") ):
		velocity.y -= 1
	if (Input.is_action_pressed ("move_down") ):
		velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		move_and_slide()
		idle_time = 0.0

		var movement_angle_rad = velocity.angle()
		var movement_angle = movement_angle_rad * 180 / PI
		if movement_angle >= -22.5 and movement_angle < 22.5:
			animated_sprite.play("walk_right")
		elif movement_angle >= 22.5 and movement_angle < 67.5:
			animated_sprite.play("walk_SE")
		elif movement_angle >= 67.5 and movement_angle < 112.5:
			animated_sprite.play("walk_down")
		elif movement_angle >= 112.5 and movement_angle < 157.5:
			animated_sprite.play("walk_SW")
		elif movement_angle >= 157.5 or movement_angle < -157.5:
			animated_sprite.play("walk_left")
		elif movement_angle >= -157.5 and movement_angle < -112.5:
			animated_sprite.play("walk_NW")
		elif movement_angle >= -112.5 and movement_angle < -67.5:
			animated_sprite.play("walk_up")
		elif movement_angle >= -67.5 and movement_angle < -22.5:
			animated_sprite.play("walk_NE")
	elif idle_time >= 10:
		animated_sprite.play("rest")
	elif idle_time < 10:
		animated_sprite.play("idle")
		idle_time += delta
