import UIKit

class NetworkManager {
    
    static let session = NetworkManager()
    
    private init() {}
    
    private var token: String?
    private var userId: Int?
}
