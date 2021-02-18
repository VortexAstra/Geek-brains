import Foundation
import Alamofire
import SwiftyJSON

struct Photo {
    let id: Int
    let sizes: [PhotoSize]
    
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.sizes = json["sizes"].arrayValue.compactMap{ PhotoSize($0) } //Функция compactMap удаляет значения nil  из массива, тип возвращаемого значения больше не является опциональным
    }
}

struct PhotoSize {
    let type: String
    let height: Int
    let width: Int
    let url: String
    
    init(_ json: JSON) {
        self.type = json["type"].stringValue
        self.height = json["height"].intValue
        self.width = json["width"].intValue
        self.url = json["url"].stringValue
    }
}
