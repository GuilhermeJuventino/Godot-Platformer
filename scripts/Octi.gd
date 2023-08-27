extends CharacterBody2D

var SPEED = 700.0

@onready var animation := $Animation as AnimatedSprite2D 
@onready var ray_cast = $CollisionRayCast as RayCast2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction := -1

func _physics_process(delta):
	handle_gravity(delta)
	handle_collision()
	handle_movement(delta)
	handle_animations()

	move_and_slide()

func handle_gravity(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_animations():
	if velocity.x < 0:
		animation.flip_h = false
	elif velocity.x > 0:
		animation.flip_h = true
		
	animation.play("Running")

func handle_movement(delta):
	velocity.x = direction * SPEED * delta

func handle_collision():
	if ray_cast.is_colliding():
		SPEED *= -1.0
		ray_cast.target_position.x *= -1.0
