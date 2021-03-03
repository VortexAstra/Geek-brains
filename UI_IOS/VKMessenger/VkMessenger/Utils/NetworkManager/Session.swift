import Foundation
import Alamofire

class Session {
    
    private init() {}
    static let shared = Session()

    var token = ""
    var userId = Int()
}
