//
//  HardLvl.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 20.05.2021.
//

import Foundation

final class HardLvl: levelStrategy {
    func selectDifficulty(lvl: LevelDifficulty) -> [String] {
        return Questions.share.question.reversed()
    }
}
