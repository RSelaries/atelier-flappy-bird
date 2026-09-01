# Global
extends Node


signal score_changed
signal died

const BASE_SPEED = 100.0

var score: int
var best_score: int
var speed: float = 100.0
var dead: bool = false


func increment_score() -> void:
	score += 1
	if score > best_score:
		best_score = score
	score_changed.emit()

func die() -> void:
	dead = true
	speed = 0.0
	died.emit()


func restart() -> void:
	dead = false
	speed = BASE_SPEED
	score = 0
	get_tree().reload_current_scene()
