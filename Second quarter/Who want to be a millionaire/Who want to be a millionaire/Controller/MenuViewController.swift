//
//  MenuViewController.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 13.05.2021.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationGameSession()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameVC" {
            let destination = segue.destination as? GameViewController
            destination?.delegate = self
        }
    }

    fileprivate func configurationGameSession() {
        let gameSession = GameSession()
        Game.shared.gameSession = gameSession
    }
}


extension MenuViewController: GameViewControllerDelegate {
    func fillTheGameSession(score: Int) {
        Game.shared.gameSession?.score = score
    }
}
