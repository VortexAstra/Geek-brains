import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelPhoto: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!
    
    var count = 0
    @IBOutlet weak var countOfLike: UILabel!
    
    @IBAction func likeButton(_ sender: UIButton) {
        guard count < 1 else {
            return
        }
        self.count += 1
        self.countOfLike.text = "\(self.count)"
//        imagePhoto.layer.shadowColor = UIColor.black.cgColor
//        imagePhoto.layer.shadowOffset = CGSize(width: -10, height: 10)
//        imagePhoto.layer.shadowRadius = 20
//        imagePhoto.layer.shadowOpacity = 0.5
        imagePhoto.layer.backgroundColor = UIColor.red.cgColor
    }
    
    @IBAction func dislikeButton(_ sender: UIButton) {
        guard count > 0 else {
            return
        }
        self.count -= 1
        self.countOfLike.text = "\(self.count)"
        imagePhoto.layer.backgroundColor = UIColor.black.cgColor
    }
}
