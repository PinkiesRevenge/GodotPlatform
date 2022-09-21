extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	apply_gravity()
	
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0: 
		apply_friction()
	else:
		apply_acceleration(input.x)
			
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -320
		
	velocity = move_and_slide(velocity)

func apply_gravity():
		velocity.y += 18
		
func apply_friction():
	pass
	
func apply_acceleration(dir):
	velocity.x = move_toward(velocity.x, 150*dir,1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
