import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageFriend: UIImageView?
    
    var indexPathPhoto: Int?
    var tempArray: [UIImage]?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFriend?.image = tempArray![indexPathPhoto!]
    }
    
    @IBAction func next(_ sender: UIButton) {
        guard self.indexPathPhoto! + 1 <= self.tempArray!.count - 1 else {return}
        
        self.imageFriend?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: []) {
            self.imageFriend?.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.indexPathPhoto! += 1
            self.imageFriend?.image = self.tempArray![self.indexPathPhoto!]
        }
    }
    
    @IBAction func prev(_ sender: UIButton) {
        guard  indexPathPhoto! - 1 >= 0 else {return}
        
        self.imageFriend?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: []) {
            self.imageFriend?.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.indexPathPhoto! -= 1
            self.imageFriend?.image = self.tempArray![self.indexPathPhoto!]
        }
    }
}
