class_name Pipe
extends Area2D


func _physics_process(delta: float) -> void:
	global_position.x -= Global.speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Bird":
		Global.die()


func _on_score_area_body_entered(body: Node2D) -> void:
	if body.name == "Bird":
		Global.increment_score()
