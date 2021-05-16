//
//  Questions.swift
//  Who want to be a millionaire
//
//  Created by artem.ustinov on 15.05.2021.
//

import Foundation

final class Questions {
    static let share = Questions()

    private init(){}

    var answer = ["Синий кит", "Язык программирования", "Дантес"]
    var question = ["Самое большое животное в мире", "Что такое Swift", "Кто убил пушкина"]
    var answerOptions  = [
        ["Синий кит", "Кот", "Акула", "Жираф"],
        ["Еда", "Язык программирования", "Духи", "Птица"],
        ["Дантес", "Лермонтов", "Жена", "Сестра"]
    ]
}
