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

    @IBOutlet weak var answerOptinal1: UITextField!
    @IBOutlet weak var answerOptinal2: UITextField!
    @IBOutlet weak var anserOptinal3: UITextField!
    @IBOutlet weak var answerOptinal4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func addQuestionsToPull(_ sender: Any) {
        if let newAnswer = answerTextField.text, let question = questionsTextField.text,
           let answerOptinal = answerOptinal1.text,  let answerOptina2 = answerOptinal2.text,
           let answerOptina3 = anserOptinal3.text ,  let answerOptina4 = answerOptinal4.text {

            if !(question.isEmpty || answerOptinal.isEmpty || answerOptinal.isEmpty ||
                    answerOptina2.isEmpty || answerOptina3.isEmpty || answerOptina4.isEmpty) {

                Questions.share.answer.append(newAnswer)
                Questions.share.question.append(question)
                Questions.share.answerOptions.append([answerOptinal, answerOptina2, answerOptina3, answerOptina4])

                navigationController?.popViewController(animated: true)
            }
        }
    }
}
