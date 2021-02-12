import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var token: String?
    var userId: Int?
    
    private init() {}
    
    private static let sessionAF: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        let session = Alamofire.Session(configuration: configuration)
        
        return session
    }()
    
    static func loadInfo(for item:String, token: String) {
        print("------------------------\(item)--------------------------------------------")
        let baseURL = "https://api.vk.com"
        let path = "/method/\(item).get"
        
        let params: Parameters = [
            "access_token": token,
            "fields": "first_name, photo_50",
            "extended": 1,
            "v": "5.92"
        ]
        
        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json["response"]["items"])
            case .failure(let error):
                print(error)
            }
        }
    }
}
