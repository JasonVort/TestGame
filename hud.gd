extends CanvasLayer
signal start_game

func show_message(text):
	$MessageLabel.text = text  #给MessageLable输入文本信息
	$MessageLabel.show()  #展示MessageLable
	$MessageTimer.start()  #打开MessageLable的计时器
	
func show_highestscore(text):
	$HighestScore.text = text
	$HighestScore.show()
	
func show_game_over():
	show_message("Game Over")
	
func _on_StartButton_pressed():
	$StartButton.hide()  #按钮隐藏
	start_game.emit()  #发出开始游戏信号
