extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	const MIN_VOLUME_LV: float=5
	const MAX_VOLUME_LV: float=300
	var vel_diff: float=0
	if body is StaticBody2D:
		vel_diff=(linear_velocity-body.constant_linear_velocity).length()
	elif body is RigidBody2D:
		vel_diff=(linear_velocity-body.linear_velocity).length()
	if vel_diff>MIN_VOLUME_LV:
		var vel=clamp((vel_diff-MIN_VOLUME_LV)/(MAX_VOLUME_LV-MIN_VOLUME_LV),0.01,1.0)
		var newvel=20*log(vel)
		$collide_sound_player.volume_db=newvel
		$collide_sound_player.play()
		print(newvel)


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			var impulse_x=randf_range(-250,250)
			var impulse_y=randf_range(-1000,-500)
			apply_impulse(Vector2(impulse_x,impulse_y))
			