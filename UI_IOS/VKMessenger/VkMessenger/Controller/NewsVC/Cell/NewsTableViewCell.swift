import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    static let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
    static let identifer = "NewsCell"
    
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var labelNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    
    
    var count: Int = 0 {
        didSet{
            likeLabel.text = String(count)
        }
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func configure(for news: News) {
        labelNews.text = news.text
        self.imageNews.kf.setImage(with: URL(string: news.url))
    }
    
    override func prepareForReuse() {
        self.textLabel?.text = ""
        self.imageNews.image = UIImage(named: "")
    }
    
    @IBAction func likeButton(_ sender: UIButton) {
        if (count > 0){
            buttonLike.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: []) {
                self.buttonLike.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            count -= 1
        } else{
            buttonLike.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: []) {
                self.buttonLike.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            count += 1
        }
    }
}
