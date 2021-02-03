import UIKit

class ProgressItem: UIView {

    let shape = UIView(frame: CGRect(x: 123, y: 380, width: 50, height: 50))
    let shape2 = UIView(frame: CGRect(x: 183, y: 380, width: 50, height: 50))
    let shape3 = UIView(frame: CGRect(x: 243, y: 380, width: 50, height: 50))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(shape)
        self.addSubview(shape2)
        self.addSubview(shape3)
        
        self.backgroundColor = UIColor.lightGray
        
        setUpView(for: shape)
        setUpView(for: shape2)
        setUpView(for: shape3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(for view: UIView) {
        view.backgroundColor = self.backgroundColor
        view.layer.cornerRadius = view.layer.frame.size.width / 2
        view.alpha = 0.2
    }
}

