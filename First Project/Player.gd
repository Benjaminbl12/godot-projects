extends Area2D

export (int) var speed #How fast the player will move around the screen
var screensize #Size of the game window

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	screensize = get_viewport_rect().size #Gets the size of the screen...
										  #from the project manager


	pass

func _process(delta):
	var velocity = Vector2() #The players movement vector
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)