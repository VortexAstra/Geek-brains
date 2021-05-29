//
//  FactoryVM.swift
//  homeWork_1
//
//  Created by artem.ustinov on 25.05.2021.
//  Copyright © 2021 Марат Нургалиев. All rights reserved.
//

import Foundation

class FactoryVM {

    func constructViewModels(from: [VkFeed]) -> [VKFeedVM] {
        from.compactMap { self.viewModel(from: $0) }
    }

    private func viewModel(from baseFeed: VkFeed) -> VKFeedVM {
        let feedDate = getStringDate(feedDate: baseFeed.feedDate)
        let attachment = baseFeed.attachments.first

        return VKFeedVM(sourceUrl: baseFeed.sourceUrl,
                         sourceName: baseFeed.sourceName,
                         feedText: baseFeed.feedText,
                         feedDate: feedDate,
                         countLikes: String(baseFeed.countLikes),
                         countViews: String(baseFeed.countViews),
                         countReposts: String(baseFeed.countReposts),
                         countComments: String(baseFeed.countComments),
                         attachmentHeight: attachment?.height,
                         attachmentWidth: attachment?.width,
                         attachmentURL: attachment?.imageUrl)
    }

}

extension FactoryVM {
    
    private func getStringDate(feedDate: Int) -> String {
        let currentDate = Date().timeIntervalSince1970

        let diffInSeconds = currentDate - Double(feedDate)
        let diffInMinutes = diffInSeconds/60
        let diffInHours = diffInMinutes/60
        let diffInDays = diffInMinutes/24

        if (diffInDays < 1
                && diffInHours < 1
                && diffInMinutes < 1
                && diffInSeconds < 60) {
            return "\(Int(diffInSeconds)) секунд назад"
        } else if (diffInDays < 1
                    && diffInHours < 1
                    && diffInMinutes < 60) {
            return "\(Int(diffInMinutes)) минут назад"
        } else if (diffInDays < 1
                    && diffInHours < 24) {
            return "\(Int(diffInHours)) часов назад"
        } else {
            return "\(Int(diffInDays)) дней назад"
        }


    }
}
