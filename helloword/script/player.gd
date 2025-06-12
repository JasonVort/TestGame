extends Node2D
@export var speed =200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	var input_dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if input_dir.length() > 0:
		input_dir = input_dir.normalized()
	velocity = input_dir * speed * delta
	position += velocity
	pass
