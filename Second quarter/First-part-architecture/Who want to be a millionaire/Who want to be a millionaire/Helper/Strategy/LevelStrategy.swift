//
//  LevelStrategy.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 20.05.2021.
//

import Foundation

protocol levelStrategy {
    func selectQuestionLabel() -> [String]
    func selectAnswerOptins() -> [[String]]
    func selectAnswer() -> [String]

}
