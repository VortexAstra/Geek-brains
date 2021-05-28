//
//  TaskProtocol.swift
//  HomeWork4
//
//  Created by artem.ustinov on 26.05.2021.
//

import Foundation

@objc
protocol Taskable {
    var name: String { get set }
    var tasks: [Taskable] { get set }

    var isComlete: Bool { get set }

    @objc optional
    func addSubItem(subItem: Taskable)
    
    @objc optional
    func deleteSubItem(subItem: Taskable)

    func getCountOfSubItem() -> Int
}
