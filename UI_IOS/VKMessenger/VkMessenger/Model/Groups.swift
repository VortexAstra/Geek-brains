import Alamofire
import SwiftyJSON

struct Group {
    
    let id: Int
    let name: String
    let photo100: String
    
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.photo100 = json["photo_100"].stringValue
    }
}

extension Group: Equatable {}
