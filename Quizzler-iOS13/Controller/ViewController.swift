//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var progressBar: UIProgressView!
	@IBOutlet weak var trueButton: UIButton!
	@IBOutlet weak var falseButton: UIButton!
	
	var quizModel = QuizModel()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		updateUI()
    }
	
	@IBAction func answerButtonPressed(_ sender: UIButton) {
		
		// Will be equal to "True" or "False"
		let userAnswer = sender.currentTitle!
		let userCorrect = quizModel.checkAnswer(userAnswer)
		
		if userCorrect {
			sender.backgroundColor = UIColor.green
		} else {
			sender.backgroundColor = UIColor.red
		}
		
		quizModel.nextQuestion()
		
		Timer.scheduledTimer(
			timeInterval: 0.3,
			target: self,
			selector: #selector(updateUI),
			userInfo: nil,
			repeats: false
		)
	}
	
	// Updates label in UI when True/False is pressed
	@objc func updateUI() {
		questionLabel.text = quizModel.getQuestionText()
		progressBar.progress = quizModel.getProgress()
		scoreLabel.text = "Score: \(quizModel.getScore())"
		trueButton.backgroundColor = UIColor.clear
		falseButton.backgroundColor = UIColor.clear
		
	}
}

