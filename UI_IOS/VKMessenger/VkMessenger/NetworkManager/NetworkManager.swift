import UIKit
import Alamofire
import SwiftyJSON

import Foundation
import  Alamofire
import SwiftyJSON

class NetworkManager {
    
    private static let baseUrl = "https://api.vk.com"
    private static let version = "5.130"
    
    //MARK:- Load Friends
    func loadFriends(completion: @escaping ([User]) -> Void) {
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "v": NetworkManager.version,
            "fields": "photo_200"
        ]
        
        AF.request(NetworkManager.baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let friendsJSONList = json["response"]["items"].arrayValue
                    let friends = friendsJSONList.compactMap { User($0) }
                    completion(friends)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    //MARK:- Load Friends Photos
    
    func loadPhotos(for userId: Int, completion: @escaping ([Photo]) -> Void) {
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "v": NetworkManager.version,
            "extended": 1,
            "owner_id": "\(userId)"
        ]
        
        AF.request(NetworkManager.baseUrl + path,
                   method: .get,
                   parameters: params)
            .response { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data as Any)
                    let photoJSONs = json["response"]["items"].arrayValue
                    let photos = photoJSONs.compactMap { Photo($0) }
                    completion(photos)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    //MARK:- Load Groups
    
    func loadGroups(completion: @escaping ([Group]) -> Void) {
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "v": NetworkManager.version,
            "extended": 1
        ]
        
        AF.request(NetworkManager.baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let groupJSONs = json["response"]["items"].arrayValue
                    let groups = groupJSONs.compactMap { Group($0) }
                    completion(groups)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    //MARK: - Group Search
    static func groupSearch(by query: String) {
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "extended": 1,
            "v": NetworkManager.version,
            "q": query,
            "type": "group"
        ]
        
        AF.request(self.baseUrl + path,
                   method: .get,
                   parameters: params)
            .responseJSON { response in
                guard let json = response.value else { return }
                print("Global Groups: ", json)
            }
    }
    
}
