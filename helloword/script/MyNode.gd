@icon("res://icon.svg")
extends Node2D;
class_name mynode;

@export var a: int = 1;
@export var b: String;

func _ready():
	print("my custom node");
	print(b);
	pass
