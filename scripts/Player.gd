extends CharacterBody2D


const SPEED = 170.0
const JUMP_FORCE = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping := false

@onready var animation := $Animation as AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer as Timer

func _physics_process(delta):
	handle_gravity(delta)
	handle_jump()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	handle_movement(direction)
	handle_animations(direction)
	
	var was_on_floor = is_on_floor()
	move_and_slide()
	
	# Starting coyote timer after the player just left a ledge
	var just_left_ledge = was_on_floor and !is_on_floor() and velocity.y >= 0
	if just_left_ledge:
		coyote_timer.start()
		
func handle_gravity(delta):
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta
		is_jumping = true
	elif is_on_floor():
		is_jumping = false

func handle_jump():
	# Handle Jump.
	if is_on_floor() or coyote_timer.time_left > 0.0:
		if Input.is_key_pressed(KEY_Z):
			velocity.y = JUMP_FORCE
			coyote_timer.stop()

func handle_movement(direction):
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func handle_animations(direction):
	if velocity.x < 0:
		animation.flip_h = true
	elif velocity.x > 0:
		animation.flip_h = false
	
	if direction != 0 and !is_jumping:
		animation.play("Running")
	elif velocity.x == 0 and !is_jumping:
		animation.play("Idle")
	elif is_jumping:
		animation.play("Jumping")
