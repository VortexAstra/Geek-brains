import RealmSwift
import SwiftyJSON


final class Group: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photo100: String = ""
    
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.photo100 = json["photo_100"].stringValue
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    override init() {}
}

