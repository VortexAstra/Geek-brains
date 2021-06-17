//
//  GameViewController.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 15.05.2021.
//

import UIKit

enum LevelDifficulty: Int {
    case easy
    case hard
}

protocol GameViewControllerDelegate {
    func fillTheGameSession(score: Int)
}

class GameViewController: UIViewController {

    @IBOutlet private weak var scoreCountLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!

    @IBOutlet private weak var firstAnswerButton: UIButton!
    @IBOutlet private weak var secondAnswerButton: UIButton!
    @IBOutlet private weak var thirdAnswerButton: UIButton!
    @IBOutlet private weak var fourthAnswerButton: UIButton!

    var difficultyLvl: levelStrategy?

    var delegate: GameViewControllerDelegate?

    var score: Int = 0 {
        didSet {
            scoreCountLabel.text = "Score  " + String(score)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configLabelWithQuestion(for: .zero)
        configButtonWithAnswer(for: .zero)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func tapOnAswerButton(_ sender: MyButton) {
        if let answer = difficultyLvl?.selectAnswer() {
            guard sender.titleLabel?.text == answer[score] else { return }
            score += 1
            delegate?.fillTheGameSession(score: score)

            if score >= answer.count {
                delegate?.fillTheGameSession(score: score)
                scoreCountLabel.text = "U win with super game your score: \(score)"
                return
            }

            configLabelWithQuestion(for: score)
            configButtonWithAnswer(for: score)
        }
    }

    func configButtonWithAnswer(for number: Int) {
        if let questions = difficultyLvl?.selectAnswerOptins(){
            firstAnswerButton.setTitle(questions[number][0], for: .normal)
            secondAnswerButton.setTitle(questions[number][1], for: .normal)
            thirdAnswerButton.setTitle(questions[number][2], for: .normal)
            fourthAnswerButton.setTitle(questions[number][3], for: .normal)
        }
    }

    func configLabelWithQuestion(for count: Int) {
        if let questions = difficultyLvl?.selectQuestionLabel(){
            questionLabel.text = questions[count]
        }
    }
}
