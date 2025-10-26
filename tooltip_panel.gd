extends PopupPanel;

@onready var label = $Label;


var is_shown = false;

func _ready():
	label.add_theme_font_size_override("font_size", 24);

#func _process(delta: float) -> void:
	#pass

func _show_tooltip(text: String):
	label.text = text;
	popup_centered();
	if not is_shown:
		is_shown = true;

func _hide_tooltip():
	if is_shown:
		hide();
		is_shown = false;
