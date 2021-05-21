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

    var difficultyLvl: LevelDifficulty?

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
        guard sender.titleLabel?.text == Questions.share.answer[score] else { return }
        score += 1
        delegate?.fillTheGameSession(score: score)
        
        if score >= Questions.share.answer.count {
            delegate?.fillTheGameSession(score: score)
            scoreCountLabel.text = "U win with super game your score: \(score)"
            return
        }

        configLabelWithQuestion(for: score)
        configButtonWithAnswer(for: score)
    }

    func configButtonWithAnswer(for number: Int) {
        reverseQuestionsForHardLvl()
        firstAnswerButton.setTitle(Questions.share.answerOptions[number][0], for: .normal)
        secondAnswerButton.setTitle(Questions.share.answerOptions[number][1], for: .normal)
        thirdAnswerButton.setTitle(Questions.share.answerOptions[number][2], for: .normal)
        fourthAnswerButton.setTitle(Questions.share.answerOptions[number][3], for: .normal)
    }

    func configLabelWithQuestion(for count: Int) {
        switch difficultyLvl {
        case .easy:
            questionLabel.text = EasyLVL().selectDifficulty(lvl: difficultyLvl!)[count]
        case .hard:
            questionLabel.text = HardLvl().selectDifficulty(lvl: difficultyLvl!)[count]
        default:
            break
        }
    }
    
    fileprivate func reverseQuestionsForHardLvl() {
        switch difficultyLvl {
        case .easy:
            break
        case .hard:
            Questions.share.answerOptions.reverse()
            Questions.share.answer.reverse()
        default:
            break
        }
    }
}
