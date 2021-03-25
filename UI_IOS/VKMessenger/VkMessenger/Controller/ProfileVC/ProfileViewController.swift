import UIKit

final class ProfileViewController: UIViewController {

    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBAction func tapOnImage(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.4, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .repeat) {
            self.userImage.frame.origin.y -= 100
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
