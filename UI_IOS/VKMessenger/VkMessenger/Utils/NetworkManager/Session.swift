import Foundation
import Alamofire

final class Session {
    
    private init() {}
    static let shared = Session()

    var token = ""
    var userId = Int()
}
