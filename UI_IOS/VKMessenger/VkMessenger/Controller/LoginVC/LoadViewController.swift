import UIKit

class LoadViewController: UIViewController {
    
    @IBOutlet weak var buttonForNextScreen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 5) {
            self.buttonForNextScreen.alpha = 1
            self.buttonForNextScreen.tintColor = .red
        }
        drawRing()
        
    }
    
    @IBAction func goNextScreen(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let memberDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(memberDetailsViewController, animated:true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    func drawRing() {
        
        let circlePath = createShape(differenceWidth: 150)
        let circlePath1 = createShape(differenceWidth: 0)
        let circlePath2 = createShape(differenceWidth: -150)
        
        let shapeLayer = configCAShapeLayer(circlePath: circlePath)
        view.layer.addSublayer(shapeLayer)
        
        let shapeLayer1 = configCAShapeLayer(circlePath: circlePath1)
        view.layer.addSublayer(shapeLayer1)
        
        let shapeLayer2 = configCAShapeLayer(circlePath: circlePath2)
        view.layer.addSublayer(shapeLayer2)
        
        //        UIView.animateKeyframes(withDuration: 3,
        //                                delay: 1,
        //                                options: [.repeat],
        //                                animations: {
        //                                    UIView.addKeyframe(withRelativeStartTime: 0,
        //                                                       relativeDuration: 0.25,
        //                                                       animations: {
        //                                                        shapeLayer.opacity = 0.4
        //                                                       })
        //                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
        //                                                       relativeDuration: 0.25,
        //                                                       animations: {
        //                                                        shapeLayer1.opacity = 0.6
        //                                                       })
        //                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
        //                                                       relativeDuration: 0.25,
        //                                                       animations: {
        //                                                        shapeLayer2.opacity = 0.7
        //                                                       })
        //                                },
        //                                completion: {(_) in
        //                                    print("DONE")})
        //
        
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.beginTime = CACurrentMediaTime() + 0.5
        animation.fromValue = 0.6
        animation.toValue = 0.3
        animation.duration = 1
        shapeLayer.add(animation, forKey: nil)
        
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fromValue = 0.6
        animation.toValue = 0.5
        animation.duration = 1
        shapeLayer1.add(animation, forKey: nil)
        
        animation.beginTime = CACurrentMediaTime() + 1.5
        animation.fromValue = 0.6
        animation.toValue = 0.6
        animation.duration = 1
        shapeLayer2.add(animation, forKey: nil)
    }
    
    func createShape(differenceWidth: CGFloat) -> UIBezierPath {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:UIScreen.main.bounds.width / 2 - differenceWidth, y:UIScreen.main.bounds.height / 2),
            radius: CGFloat(30),
            startAngle: CGFloat(0),
            endAngle:CGFloat(Double.pi * 2),
            clockwise: true)
        return circlePath
    }
    
    
    func configCAShapeLayer(circlePath: UIBezierPath) -> CAShapeLayer{
        let temp = CAShapeLayer()
        temp.masksToBounds = false
        temp.path = circlePath.cgPath
        temp.fillColor = UIColor.black.cgColor
        temp.strokeColor = UIColor.white.cgColor
        temp.lineWidth = 3
        return temp
    }
}
