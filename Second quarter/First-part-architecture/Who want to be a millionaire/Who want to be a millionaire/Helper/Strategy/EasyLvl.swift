//
//  EasyLvl.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 20.05.2021.
//

import Foundation

class EasyLVL: levelStrategy {
    func selectAnswer() -> [String] {
        return Questions.share.answer
    }

    func selectAnswerOptins() -> [[String]] {
        return Questions.share.answerOptions
    }

    func selectQuestionLabel() -> [String] {
        return Questions.share.question
    }
    
}

