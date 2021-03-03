import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class Photo: Object {
    @objc dynamic var id: Int = 0
    var sizes: [PhotoSize]?
    
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.sizes = json["sizes"].arrayValue.compactMap{PhotoSize($0)}
    }
    override init(){}
}

class PhotoSize: Object {
    @objc dynamic var type: String = ""
    @objc dynamic var height: Int = 0
    @objc dynamic var width: Int = 0
    @objc dynamic var url: String = ""
    
    init(_ json: JSON) {
        self.type = json["type"].stringValue
        self.height = json["height"].intValue
        self.width = json["width"].intValue
        self.url = json["url"].stringValue
    }
    override init() {}
}
