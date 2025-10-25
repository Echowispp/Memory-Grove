extends Area2D

@onready var memory_popup = owner.get_node("MemoryPopup");
@onready var tooltip_popup = owner.get_node("TooltipPanel");
@onready var player = owner.get_node("WorldSort/player");

static var active_leaf = null;

func _ready():
	z_index = int(global_position.y);



func _process(_delta: float):
	var player_distance = (player.global_position - self.global_position).length();
	
	if player_distance < 32:
		if active_leaf != self:
			if not memory_popup.visible:
				tooltip_popup._show_tooltip("Press [Space] to interact");
				active_leaf = self;

		if Input.is_action_just_pressed("interact"):
			tooltip_popup._hide_tooltip();
			print("Tooltip hidden, showing memory instead");
			active_leaf = null;
			memory_popup._show_memory("example", "example paragraph");

	elif active_leaf == self:
		tooltip_popup._hide_tooltip();
		print("Tooltip hidden from distance");
		active_leaf = null;
	
