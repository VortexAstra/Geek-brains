import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var count: Int = 0 {
        didSet{
            likeLabel.text = String(count)
        }
    }
    
    static let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
    static let identifer = "NewsCell"
    
    @IBAction func likeButton(_ sender: UIButton) {
        count = count + 1
    }
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var labelNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    var newLayer:CAGradientLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newLayer = CAGradientLayer()
        newLayer.frame = contentView.frame
        newLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor ]
        contentView.layer.insertSublayer(newLayer, at: 0)
    }
}
