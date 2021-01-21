import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var nameOfFriend: UILabel!
    
    override func layoutSubviews() {
        nameOfFriend.layer.masksToBounds = false
        nameOfFriend.layer.shadowRadius = 2.5
        nameOfFriend.layer.shadowOpacity = 0.5
        nameOfFriend.layer.shadowOffset = CGSize(width: 1, height: 2)
        
//        imageFriend.layer.masksToBounds = false
//        imageFriend.layer.cornerRadius = 30
//        imageFriend.layer.shadowRadius = 30
//        imageFriend.layer.shadowOpacity = 0.3
//        imageFriend.layer.shadowOffset = CGSize(width: 1, height: 2)
//
    }
}
