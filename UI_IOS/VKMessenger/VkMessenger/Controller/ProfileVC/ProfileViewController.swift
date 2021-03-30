import UIKit
import Kingfisher

final class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    var user: [User]? {
        didSet{
            self.userName.text = self.user?[0].firstName
            self.userImage.kf.setImage(with: URL(string: self.user?[0].photo100 ?? ""))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkManager = NetworkManager()
        networkManager.getUserInfo { [weak self] (userInfo) in
            self?.user = userInfo
        }
    }
}
