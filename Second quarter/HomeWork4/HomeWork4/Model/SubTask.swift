//
//  SubTask.swift
//  HomeWork4
//
//  Created by artem.ustinov on 26.05.2021.
//

import Foundation

class SubTask: Taskable {
    var tasks: [Taskable]
    var name: String
    var isComlete: Bool = false

    init(name: String) {
        self.name = name
        self.tasks = []
    }

    func addSubItem(subItem: Taskable) {
        tasks.append(subItem)
    }

    func deleteSubItem(subItem: Taskable) { }

    func getCountOfSubItem() -> Int {
        return tasks.count
    }
}
