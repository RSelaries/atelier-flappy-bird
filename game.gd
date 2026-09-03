extends Node2D


var speed: float = 100


@onready var pipe_1: Pipe = $Pipe1
@onready var pipe_2: Pipe = $Pipe2
@onready var pipe_3: Pipe = $Pipe3
@onready var pipe_4: Pipe = $Pipe4
@onready var pipe_5: Pipe = $Pipe5
@onready var pipe_spawn_timer: Timer = $PipeSpawnTimer
@onready var replay_button: Button = $CanvasLayer/ReplayButton
@onready var score_label: Label = %ScoreLabel
@onready var best_score_label: Label = %BestScoreLabel
@onready var background_scroll: Parallax2D = $BackgroundScroll


var current_pipe: int = 1


func _ready() -> void:
	Global.died.connect(_on_died)
	Global.score_changed.connect(_on_score_changed)
	Global.speed_changed.connect(_on_speed_changed)
	
	background_scroll.autoscroll.x = Global.speed * -0.5
	update_score()
	replay_button.hide()
	spawn_pipe()


func spawn_pipe() -> void:
	match current_pipe:
		1:
			pipe_1.global_position.x = 1250
			pipe_1.global_position.y = randi_range(164, 470)
		2:
			pipe_2.global_position.x = 1250
			pipe_2.global_position.y = randi_range(164, 470)
		3:
			pipe_3.global_position.x = 1250
			pipe_3.global_position.y = randi_range(164, 470)
		4:
			pipe_4.global_position.x = 1250
			pipe_4.global_position.y = randi_range(164, 470)
		5:
			pipe_5.global_position.x = 1250
			pipe_5.global_position.y = randi_range(164, 470)
	
	current_pipe += 1
	if current_pipe > 5:
		current_pipe = 1


func _on_speed_changed() -> void:
	background_scroll.autoscroll.x = Global.speed * -0.5


func _on_died() -> void:
	pipe_spawn_timer.stop()
	replay_button.show()


func _on_score_changed() -> void:
	update_score()


func update_score() -> void:
	score_label.text = str(Global.score)
	best_score_label.text = str(Global.best_score)


func _on_pipe_spawn_timer_timeout() -> void:
	spawn_pipe()


func _on_replay_button_pressed() -> void:
	Global.restart()
