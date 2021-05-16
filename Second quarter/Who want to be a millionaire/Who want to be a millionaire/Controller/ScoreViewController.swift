//
//  ScoreViewController.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 15.05.2021.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score = Game.shared.gameSession?.score {
            countLabel.text = String(score)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let careTaker = DBEmitator<Int>()
        careTaker.save(results: [Game.shared.gameSession?.score ?? .zero])
    }

    @IBAction func showButton(_ sender: UIButton) {
        let careTaker = DBEmitator<Game>()
        print(careTaker.retrieveResults().count)
    }
}
