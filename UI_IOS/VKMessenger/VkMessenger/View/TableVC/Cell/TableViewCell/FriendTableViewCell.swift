import UIKit
import Kingfisher

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var nameOfFriend: UILabel!
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        self.imageFriend.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: []) {
            self.imageFriend.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    override func layoutSubviews() {
        imageFriend.isUserInteractionEnabled = true
        imageFriend.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        
        nameOfFriend.layer.masksToBounds = false
        nameOfFriend.layer.shadowRadius = 2.5
        nameOfFriend.layer.shadowOpacity = 0.5
        nameOfFriend.layer.shadowOffset = CGSize(width: 1, height: 2)
        
    }
    
    func configure(with user: User) {
            self.nameOfFriend.text = "\(user.firstName) \(user.lastName)"
            let url = URL(string: user.photo100)
            self.imageFriend.kf.setImage(with: url)
        }
    
    
}
