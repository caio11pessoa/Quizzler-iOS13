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
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var thirdOption: UIButton!
    
var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    @objc
    func updateUI() {
        
        let Answer = quizBrain.getAnswer()
        
        questionLabel.text = quizBrain.getQuestionText()
        firstOption.setTitle(Answer[0], for: .normal)
        secondOption.setTitle(Answer[1], for: .normal)
        thirdOption.setTitle(Answer[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstOption.backgroundColor = UIColor.clear
        secondOption.backgroundColor = UIColor.clear
        thirdOption.backgroundColor = UIColor.clear
        
        

    }
}

