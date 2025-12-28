extends Node

@onready var score_label: Label = $CanvasLayer/scoreLabel
@onready var question_screen: Node = $questionScreen
@onready var answer_page: Node = $AnswerPage
@onready var quote_to_guess: Label = $questionScreen/VBoxContainer/PanelContainer/quoteToGuess
@onready var ending_screen: Node = $endingScreen
@onready var starting_screen: Node = $startingScreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.storeReferenceToMain(self)
	hide_ending_screen()
	hide_question_screen()
	hide_answer_page()
	pass # Replace with function body.

func startGame():
	hide_starting_screen()
	unhide_question_screen()

func endGame():
	hide_answer_page()
	unhide_ending_screen()
	
func hide_starting_screen():
	starting_screen.get_child(0).visible = false
	starting_screen.set_process(false)
	
func unhide_starting_screen():
	starting_screen.set_process(true)
	starting_screen.get_child(0).visible = true

func hide_ending_screen():
	ending_screen.get_child(0).visible = false
	ending_screen.set_process(false)
	
func unhide_ending_screen():
	ending_screen.set_process(true)
	ending_screen.get_child(0).visible = true

func hide_question_screen():
	question_screen.get_child(0).visible = false
	question_screen.set_process(false)
	pass
	
func unhide_question_screen():
	question_screen.set_process(true)
	if global.quoteObjects.size() != 0:
		quote_to_guess.text = global.quoteObjects[0].quoteText
	question_screen.get_child(0).visible = true
	
func hide_answer_page():
	answer_page.get_child(0).visible = false
	answer_page.set_process(false)
	pass
	
func unhide_answer_page():
	answer_page.set_process(true)
	answer_page.get_child(0).visible = true
	
func updateScoreLabel():
	score_label.text = str(global.score) + "/10"
	
func showAnswerPage(answerPanel):
	hide_question_screen()
	var newAnswerPanel = answerPanel
	answer_page.get_child(0).get_child(0).replace_by(answerPanel.instantiate())
	unhide_answer_page()
	
func nextQuestion():
	global.changeQuestion()
	if global.quoteObjects.size() == 0:
		return
	hide_answer_page()
	unhide_question_screen()
	


func checkAnswer(answer):
	var correctAnswer = global.quoteObjects[0].correctAnswer
	var answerPanel = global.quoteObjects[0].answerPanel
	showAnswerPage(answerPanel)
	if correctAnswer == answer:
		global.updateScore(true)
		updateScoreLabel()
	else:
		global.updateScore(false)
		updateScoreLabel()
	pass
	
func _on_m_button_button_up() -> void:
	var answer = "m"
	checkAnswer(answer)
	pass # Replace with function body.


func _on_n_button_button_up() -> void:
	var answer = "n"
	checkAnswer(answer)
	pass # Replace with function body.



func _on_next_quote_button_button_up() -> void:
	nextQuestion()
	pass # Replace with function body.


func _on_begin_game_button_button_up() -> void:
	startGame()
	pass # Replace with function body.
