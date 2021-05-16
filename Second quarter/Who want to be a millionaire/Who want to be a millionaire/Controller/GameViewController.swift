//
//  GameViewController.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 15.05.2021.
//

import UIKit

protocol GameViewControllerDelegate {
    func fillTheGameSession(score: Int)
}

class GameViewController: UIViewController {

    var delegate: GameViewControllerDelegate?

    var score: Int = 0 {
        didSet {
            scoreCountLabel.text = String(score)
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scoreCountLabel: UILabel!

    @IBOutlet private weak var questionLabel: UILabel!

    @IBOutlet private weak var firstAnswerButton: UIButton!
    @IBOutlet private weak var secondAnswerButton: UIButton!
    @IBOutlet private weak var thirdAnswerButton: UIButton!
    @IBOutlet private weak var fourthAnswerButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        configLabelWithQuestion(for: 0)
        configButtonWithAnswer(for: 0)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func tapOnAswerButton(_ sender: MyButton) {
        guard score < Questions.share.answer.count else { return }
        guard sender.titleLabel?.text == Questions.share.answer[score] else { return }
        score += 1
        delegate?.fillTheGameSession(score: score)
        
        if score >= Questions.share.answer.count {
            delegate?.fillTheGameSession(score: score)
            return
        }
        configLabelWithQuestion(for: score)
        configButtonWithAnswer(for: score)
    }

    func configButtonWithAnswer(for number: Int) {
        firstAnswerButton.setTitle(Questions.share.answerOptions[number][0], for: .normal)
        secondAnswerButton.setTitle(Questions.share.answerOptions[number][1], for: .normal)
        thirdAnswerButton.setTitle(Questions.share.answerOptions[number][2], for: .normal)
        fourthAnswerButton.setTitle(Questions.share.answerOptions[number][3], for: .normal)
    }

    func configLabelWithQuestion(for count: Int) {
        questionLabel.text = Questions.share.question[count]
    }
}
