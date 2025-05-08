extends PathFollow2D
@onready var timer: Timer = $Timer
@onready var bullet = preload("res://scenes/bullet.tscn")
var my_speed = 0.001
@onready var hero: CharacterBody2D = $"../../Hero"
var bullet_speed = 400
func _ready() -> void:
	randomize()
	timer.wait_time = randf_range(0.5, 1.5)
	timer.start()
	

func _physics_process(delta: float) -> void:
	
	progress_ratio += my_speed


func _on_timer_timeout() -> void:
	var my_bullet = bullet.instantiate()
	my_bullet.position = self.global_position
	var bullet_direction = hero.global_position - self.global_position
	
	my_bullet.set_bullet(bullet_direction.angle() , bullet_speed + randi_range(0, 100))
	
	get_parent().add_child(my_bullet)
	timer.wait_time = randf_range(0.5, 1.5)
