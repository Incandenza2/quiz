extends Node



var score = 0
var mainNode : Node


var quote1 = {"quoteText" : "MMMM af", "correctAnswer": "m", "answerPanel" : load("res://scenes/answerPanel.tscn")}
var quote2 = {"quoteText" : "NNNN af", "correctAnswer": "n", "answerPanel" : load("res://scenes/answerPanel.tscn")}

var quoteObjects = [quote1, quote2, quote1, quote2, quote1, quote2, quote1, quote2, quote1, quote2]

func storeReferenceToMain(main):
	mainNode = main


func updateScore(value:bool):
	if value == true:
		score += 1
	pass


func endGame():
	pass

func changeQuestion():
	quoteObjects.pop_front()
	if quoteObjects.size() == 0:
		mainNode.endGame()
