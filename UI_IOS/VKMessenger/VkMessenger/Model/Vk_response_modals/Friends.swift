import UIKit

 
struct Welcome: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: Double
    let firstName, lastName: String
    let isClosed, canAccessClosed: Bool
    let domain: String
    let city: City?
    let online: Int
    let trackCode: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case domain, city, online
        case trackCode = "track_code"
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let title: String
}
