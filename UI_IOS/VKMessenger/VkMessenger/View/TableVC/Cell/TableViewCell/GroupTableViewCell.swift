import UIKit

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewGroup: UIImageView!
    @IBOutlet weak var nameOfGroup: UILabel!
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        self.imageViewGroup.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: []) {
            self.imageViewGroup.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewGroup.isUserInteractionEnabled = true
        imageViewGroup.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
    }
    func config(with group: Group) {
        self.nameOfGroup.text = group.name
        let url = URL(string: group.photo100)
        self.imageViewGroup.kf.setImage(with: url)
    }
}
