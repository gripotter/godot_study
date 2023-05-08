extends Node2D

var ball_scene=preload("res://ball.tscn")

func _input(event):	
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var ball=ball_scene.instantiate()
			ball.position=get_global_mouse_position()
			$balls.add_child(ball)
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var screen_size=get_viewport_rect().size
	var balls = $balls.get_children()
	for ball in balls:
		if ball.position.x<0||ball.position.x>screen_size.x|| \
		ball.position.y>screen_size.y:
			ball.queue_free()
			print("cut!")
