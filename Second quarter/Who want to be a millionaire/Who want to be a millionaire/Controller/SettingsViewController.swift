//
//  SettingsViewController.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 15.05.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var questionsTextField: UITextField!

    @IBOutlet weak var answerTextField: UITextField!

    @IBOutlet weak var answerOptinsTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func addQuestionsToPull(_ sender: Any) {

        if let newAnswer = answerTextField.text, let question = questionsTextField.text {
            Questions.share.answer.append(newAnswer)
            Questions.share.question.append(question)
            print(answerOptinsTextField.text as Any)
        }
    }
}
