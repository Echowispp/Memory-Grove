extends Area2D

@onready var memory_popup = owner.get_node("MemoryPopup")
@onready var player = owner.get_node("WorldSort/player")

func _ready():
	z_index = int(global_position.y)



func _process(_delta: float):
	var player_distance = player.position - self.position;
	if player_distance.length() < 32 and Input.is_action_just_pressed("interact"):
		memory_popup._show_memory("example", "example paragraph")
