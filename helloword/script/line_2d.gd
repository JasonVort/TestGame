extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pointTest()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(float) -> void:
	var player = get_parent().find_child("Player")
	var position = player.position
	add_point(position)
	if (get_point_count() >= 40):
		remove_point(0)
	pass

func pointTest():
	add_point(Vector2(100,100))
	add_point(Vector2(100,200))
	add_point(Vector2(200,200))
	pass
