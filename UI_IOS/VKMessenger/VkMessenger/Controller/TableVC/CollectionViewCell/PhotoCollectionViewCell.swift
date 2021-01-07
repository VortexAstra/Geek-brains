import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var likeLabel: LikeView!
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBAction func click(_ sender: Any) {
        guard let likeControl = sender as? LikeView else {
            return
        }
        if likeControl.isLike {
            likeControl.isLike = false
            likeControl.countLike -= 1
        } else {
            likeControl.isLike = true
            likeControl.countLike += 1
        }
        
    }
}
