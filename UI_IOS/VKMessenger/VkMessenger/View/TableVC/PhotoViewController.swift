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
        guard indexPathPhoto! + 1 <= tempArray!.count - 1 else {return}
        imageFriend?.image = tempArray![indexPathPhoto! + 1]
        indexPathPhoto! += 1
    }
    
    @IBAction func prev(_ sender: UIButton) {
        guard  indexPathPhoto! - 1 >= 0 else {return}
        imageFriend?.image = tempArray![indexPathPhoto! - 1]
        indexPathPhoto! -= 1
    }
}
