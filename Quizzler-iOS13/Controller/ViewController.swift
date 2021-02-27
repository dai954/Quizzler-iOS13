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
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var upperButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let questionAnswerArray = quizBrain.getAnswerText()
        upperButton.setTitle("\(questionAnswerArray[0])", for: .normal)
        middleButton.setTitle("\(questionAnswerArray[1])", for: .normal)
        bottomButton.setTitle("\(questionAnswerArray[2])", for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score\(quizBrain.getScore())"
        upperButton.backgroundColor = UIColor.clear
        middleButton.backgroundColor = UIColor.clear
        bottomButton.backgroundColor = UIColor.clear
    }
    
}

