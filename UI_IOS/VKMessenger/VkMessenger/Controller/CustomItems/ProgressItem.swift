import UIKit

class ProgressItem: UIView {

    let bar1 = UIView(frame: CGRect(x: 123, y: 380, width: 50, height: 50))
    let bar2 = UIView(frame: CGRect(x: 183, y: 380, width: 50, height: 50))
    let bar3 = UIView(frame: CGRect(x: 243, y: 380, width: 50, height: 50))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(bar1)
        self.addSubview(bar2)
        self.addSubview(bar3)
        
        self.backgroundColor = UIColor.lightGray
        
        setUpView(for: bar1)
        setUpView(for: bar2)
        setUpView(for: bar3)
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

