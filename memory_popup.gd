extends PopupPanel;


@onready var title_label =\
$MarginContainer/VBoxContainer/Label;
@onready var description_label =\
$MarginContainer/VBoxContainer/RichTextLabel; 
@onready var close_button =\
$MarginContainer/VBoxContainer/Button;

func _ready():
	close_button.pressed.connect(_on_close_pressed);
	description_label.custom_minimum_size.y = 110;
	title_label.custom_minimum_size.y = 50;
	close_button.custom_minimum_size.y = 20;
	title_label.add_theme_font_size_override("font_size", 24);
	description_label.add_theme_font_size_override("normal_font_size", 24);

func _show_memory(title_text: String, description: String):
	title_label.text = title_text;
	description_label.text = description;
	popup_centered();
	
func _on_close_pressed():
	hide();
