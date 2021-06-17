//
//  HardLvl.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 20.05.2021.
//

import Foundation

final class HardLvl: levelStrategy {
    func selectAnswer() -> [String] {
        return Questions.share.answer.reversed()
    }
    
    
    func selectAnswerOptins() -> [[String]] {
        return Questions.share.answerOptions.reversed()
    }

    func selectQuestionLabel() -> [String] {
        return Questions.share.question.reversed()
    }
}
