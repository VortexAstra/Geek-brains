//
//  Game.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 16.05.2021.
//

import Foundation

final class Game: Codable {
    static let shared = Game()

    var gameSession: GameSession?

    private  init() {}
}
