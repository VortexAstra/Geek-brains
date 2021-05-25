//
//  VKFeedVM.swift
//  homeWork_1
//
//  Created by artem.ustinov on 25.05.2021.
//  Copyright © 2021 Марат Нургалиев. All rights reserved.
//

import Foundation

struct VKFeedVM {
   var sourceUrl: String
   var sourceName: String

   var feedText: String
   var feedDate: String

   var countLikes: String
   var countViews: String
   var countReposts: String
   var countComments: String

   var attachmentHeight: Int?
   var attachmentWidth: Int?
   var attachmentURL: String?
 }
