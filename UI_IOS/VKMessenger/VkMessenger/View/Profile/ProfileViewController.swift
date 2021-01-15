import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.image = user.image[0]
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userName.text = user.name
    }
}