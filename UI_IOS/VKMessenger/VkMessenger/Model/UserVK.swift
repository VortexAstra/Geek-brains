//
//  UserVK.swift
//  VkMessenger
//
//  Created by Артем Устинов on 18.02.2021.
//

import SwiftyJSON

struct User {

    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String

    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photo100 = json["photo_200"].stringValue
    }
}
