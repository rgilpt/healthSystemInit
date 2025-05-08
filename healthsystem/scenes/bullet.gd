extends CharacterBody2D

var direction = 0
var speed = 300.0
var life_time = 0
var max_life_time = 4


func _physics_process(delta: float) -> void:
	var vector_speed = Vector2(cos(direction), sin(direction))
	vector_speed.normalized()
	velocity = vector_speed * speed
	move_and_slide()
	
	life_time += delta
	if life_time > max_life_time:
		get_parent().remove_child(self)
		self.queue_free()
		
func set_bullet(my_direction, my_speed):
	direction = my_direction
	speed = my_speed
