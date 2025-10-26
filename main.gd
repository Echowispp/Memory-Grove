extends Node2D

@onready var particles = $CPUParticles2D;

func _ready() -> void:
	particles.emitting = true;
	particles.amount = 25;
	particles.lifetime = 3;



#func _process(delta: float) -> void:
	#pass
