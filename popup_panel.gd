extends PopupPanel

@onready var title_label =\
$MarginContainer/VBoxContainer/Label
@onready var description_label =\
$MarginContainer/VBoxContainer/RichTextLabel  
@onready var close_button =\
$MarginContainer/VBoxContainer/Button

func _ready():
	close_button.pressed.connect(_on_close_pressed) 

func _show_memory(title_text: String, description: String):
	title_label.text = title_text
	description_label.text = description
	popup_centered()

func _on_close_pressed():
	hide()
