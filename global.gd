# Global
extends Node


signal score_changed
signal died
signal speed_changed

const BASE_SPEED = 100.0

var score: int
var best_score: int
var speed: float = 100.0
var dead: bool = false


func change_speep(new_speed: float) -> void:
	speed = new_speed
	speed_changed.emit()


func speed_up() -> void:
	change_speep(speed * 1.01)


func increment_score() -> void:
	score += 1
	if score > best_score:
		best_score = score
	score_changed.emit()

func die() -> void:
	dead = true
	change_speep(0.0)
	died.emit()


func restart() -> void:
	dead = false
	change_speep(BASE_SPEED)
	score = 0
	get_tree().reload_current_scene()
