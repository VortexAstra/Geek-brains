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
    
    static func loadInfoByGroups(token: String) {
        
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "fields": "first_name, photo_50",
            "extended": 1,
            "v": "5.92"
        ]

        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error)
            }
        }
//        Думаю как лучше реализовать
//        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseData(completionHandler: { (response) in
//
//            guard let data = response.value else { return }
//            do {
//                let groups = try JSONDecoder().decode([Welcome].self, from: data)
//                print(groups)
//            } catch {
//                print(error)
//            }
//        })
    }
    
    static func loadInfoByFriends(token: String) {
        
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "fields": "first_name, photo_50",
            "extended": 1,
            "v": "5.92"
        ]
        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error)
            }
        }
//         Думаю как лучше реализовать
//        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseData(completionHandler: { (response) in
//
//            guard let data = response.value else { return }
//            do {
//
//                let friends = try JSONDecoder().decode([Welcome].self, from: data)
//                print(friends.map{$0.city})
//            } catch {
//                print(error)
//            }
//        })
    }
}
