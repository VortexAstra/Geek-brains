//
//  MenuViewController.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 13.05.2021.
//

import UIKit

final class MenuViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationGameSession()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameVC" {
            if let destination = segue.destination as? GameViewController {
                let diff = LevelDifficulty(rawValue: segmentControl.selectedSegmentIndex)
                destination.difficultyLvl = diff == .easy ? EasyLVL() : HardLvl()
                destination.delegate = self
            }
        }
    }

    fileprivate func configurationGameSession() {
        Game.shared.gameSession = GameSession()
    }
}


extension MenuViewController: GameViewControllerDelegate {
    func fillTheGameSession(score: Int) {
        Game.shared.gameSession?.score = score
    }
}
