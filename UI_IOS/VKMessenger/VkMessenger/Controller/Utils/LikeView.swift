import UIKit

@IBDesignable
class LikeView: UIControl {

    private let likeImage = UIImage(named: "like")
    private let likeOffImage = UIImage(named: "likeoff")
    
    @IBInspectable var isLike: Bool = false {
        didSet {
            imageView.tintColor = isLike ? likeColor : likeOffColor
            imageView.image = isLike ? likeImage : likeOffImage
            setNeedsLayout()
        }
    }
    
    @IBInspectable var countLike: Int = 0 {
        didSet {
            label.text = "\(countLike)"
            setNeedsLayout()
        }
    }
    
    @IBInspectable var likeColor: UIColor = .red {
        didSet {
            imageView.tintColor = isLike ? likeColor : likeOffColor
            setNeedsLayout()
        }
    }
    
    @IBInspectable var likeOffColor: UIColor = .black {
        didSet {
            imageView.tintColor = isLike ? likeColor : likeOffColor
            setNeedsLayout()
        }
    }
    
    // MARK: - Sub Views
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 0.0
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        
        imageView.layer.shadowRadius = 3
        imageView.layer.shadowOpacity = 0.6
        imageView.layer.shadowColor = UIColor.white.cgColor
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .right
        label.isUserInteractionEnabled = false
        
        label.layer.shadowRadius = 3
        label.layer.shadowOpacity = 0.6
        label.layer.shadowColor = UIColor.white.cgColor
        return label
    }()
    
    
    // MARK: - Init's
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addNeedViews()
        updateNeedViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addNeedViews()
        updateNeedViews()
    }
    
    override var bounds: CGRect {
        didSet {
            updateNeedViews()
        }
    }
    
    // MARK: - Private
    
    private func addNeedViews() {
        self.isEnabled = true
        addSubview(imageView)
        addSubview(label)
    }
    
    private func updateNeedViews() {
        // imigemageView
        let h = self.bounds.height
        imageView.frame = CGRect(x: bounds.width - h, y: 0, width: h, height: h)
        imageView.tintColor = isLike ? likeColor : likeOffColor
        imageView.image = isLike ? likeImage : likeOffImage
        
        // label
        label.text = "\(countLike)"
        label.frame = CGRect(x: 0, y: 0, width: bounds.width - h - 16, height: bounds.height)
        
    }
    
    // MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        updateNeedViews()
        setNeedsDisplay()
    }
    
}
