extends Area2D
@export var speed = 200
var screen_size
func _ready():
	screen_size = get_viewport_rect().size  #获取屏幕的尺寸

	#hide()  #隐藏玩家
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed(&"ui_right"):
		velocity.x += 1
	if Input.is_action_pressed(&"ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed(&"ui_down"):
		velocity.y += 1
	if Input.is_action_pressed(&"ui_up"):
		velocity.y -= 1
		#判断玩家是否移动，并对动话进行播放或者停止
	if  velocity.length() > 0:
		velocity = velocity.normalized() * speed    #单位化向量
		$AnimatedSprite2D.play()  #向量大于0，即玩家移动的时候，播放动画s
	else:
		$AnimatedSprite2D.stop()  #向量小于等于0，即玩家不动的时候，停止动画
	
	position += velocity * delta  #通过向量和帧率之和计算移动的距离
	position = position.clamp(Vector2.ZERO,screen_size)  #限制玩家不能移动超出屏幕范围
	
	if velocity.x > 0:  #如果玩家再水平方向上面移动
		$AnimatedSprite2D.animation = &"right"  #选择播放“right”动画
		$AnimatedSprite2D.flip_v = false
		rotation = PI / 2
		$GPUParticles2D.global_rotation = 90
	if velocity.x < 0:
		$AnimatedSprite2D.animation = &"right"
		rotation = - PI/2
	if velocity.y > 0:
		$AnimatedSprite2D.animation = &"up"
		rotation = PI
	if velocity.y < 0:
		$AnimatedSprite2D.animation = &"up"
		rotation = 0
		
