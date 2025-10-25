extends PopupPanel

@onready var title_label =\
$MarginContainer/VBoxContainer/Label

var is_shown = false

#func _ready() -> void:
	#pass 

#func _process(delta: float) -> void:
	#pass

func _show_tooltip(text: String):
	title_label.text = text;
	if not is_shown:
		popup_centered();
		is_shown = true;

func _hide_tooltip():
	print("Attempt to hide tooltip, is_shown = ", is_shown)
	if is_shown:
		hide();
		print("Tooltip visible = ", visible)
		is_shown = false
