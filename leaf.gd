extends Area2D;

@onready var memory_popup = owner.get_node("MemoryPopup");
@onready var tooltip_popup = owner.get_node("TooltipPanel");
@onready var player = owner.get_node("WorldSort/player");

@export var memory_description: String = "Default description"
@export var has_ended: bool = false

static var active_leaf = null;
var has_been_shown = false;

func _ready():
	z_index = int(global_position.y);



func _process(_delta: float):
	var player_distance = (player.global_position - self.global_position).length();
	
	if player_distance < 32:
		if active_leaf != self and not memory_popup.visible and not has_been_shown:
			tooltip_popup._show_tooltip("Press [Space] or LMB to inspect");
			active_leaf = self;

		if Input.is_action_just_pressed("interact"):
			tooltip_popup._hide_tooltip();
			active_leaf = null;
			memory_popup._show_memory("As you look closer at the leaf, a memory from your past flashes by.", memory_description);
			has_been_shown = true;
			print("has_ended = ", has_ended)  # Debug print
			if has_ended:
				player._trigger_ending()

	elif active_leaf == self:
		tooltip_popup._hide_tooltip();
		active_leaf = null;
	
