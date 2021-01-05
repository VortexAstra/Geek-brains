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
        imagePhoto.clipsToBounds = false
        imagePhoto.layer.shadowColor = UIColor.red.cgColor
        imagePhoto.layer.shadowOpacity = 1
        imagePhoto.layer.shadowOffset = CGSize.zero
        imagePhoto.layer.shadowRadius = 10
    }
    
    @IBAction func dislikeButton(_ sender: UIButton) {
        guard count > 0 else {
            return
        }
        self.count -= 1
        self.countOfLike.text = "\(self.count)"
        imagePhoto.clipsToBounds = false
        imagePhoto.layer.shadowColor = UIColor.white.cgColor
        imagePhoto.layer.shadowOpacity = 1
        imagePhoto.layer.shadowOffset = CGSize.zero
        imagePhoto.layer.shadowRadius = 30
    }
}
