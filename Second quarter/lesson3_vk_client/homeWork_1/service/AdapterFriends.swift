//
//  AdapterFriends.swift
//  homeWork_1
//
//  Created by artem.ustinov on 25.05.2021.
//  Copyright © 2021 Марат Нургалиев. All rights reserved.
//

import Foundation

class AdapterFriends {
    var uid: Int
    var online: Int
    var user_id: Int
    var nickname: String
    var last_name: String
    var first_name: String
    var full_name: String
    var photo: String

    init(_ vkFriend: VkFriend) {
        self.uid = vkFriend.uid
        self.online = vkFriend.online
        self.user_id = vkFriend.user_id
        self.nickname = vkFriend.nickname
        self.last_name = vkFriend.last_name
        self.first_name = vkFriend.first_name
        self.full_name = vkFriend.full_name
        self.photo = vkFriend.photo
    }

}
