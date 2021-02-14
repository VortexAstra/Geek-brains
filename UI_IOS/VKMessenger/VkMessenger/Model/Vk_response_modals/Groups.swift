import UIKit

struct Groups : Codable{
    var id: Int = 0
    var is_admin: Int = 0
    var is_advertiser: Int = 0
    var is_closed: Bool = false
    var is_member: Int = 1
    var name: String = ""
    var photo_100: String = ""
    var photo_200: String = ""
    var photo_50: String = ""
    var screen_name: String = ""
    var type: String = ""
}
