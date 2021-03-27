import UIKit
import SwiftyJSON

final class News: Codable {
    let sourceID, date: Int
    let canDoubtCategory, canSetCategory: Bool
    let text: String
    let markedAsAds: Int
    let isFavorite: Bool
    let postID: Int
    let signerID, topicID: Int?
    let url: String
    
    init(_ json: JSON) {
        self.sourceID = json["source_id"].intValue
        self.date = json["date"].intValue
        self.canDoubtCategory = json["can_doubt_category"].boolValue
        self.canSetCategory = json["can_set_category"].boolValue
        self.text = json["text"].stringValue
        self.markedAsAds = json["marked_as_ads"].intValue
        self.isFavorite = json["is_favorite"].boolValue
        self.postID = json["post_id"].intValue
        self.signerID = json["signer_id"].intValue
        self.topicID = json["topic_id"].intValue
        self.url = json["attachments"][0]["photo"]["sizes"][6]["url"].stringValue
    }
}
