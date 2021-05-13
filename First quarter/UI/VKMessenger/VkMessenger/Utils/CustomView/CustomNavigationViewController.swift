import UIKit

class CustomNavigationViewController: UINavigationController, UINavigationControllerDelegate {
    
    let interactiveTransition = MyInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        view.backgroundColor = .white
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            if navigationController.viewControllers.first != toVC {
                interactiveTransition.viewController = toVC
            }
            
            return CustomPushAnimator()
        case .pop:
            interactiveTransition.viewController = toVC
            return CustomPopAnimator()
        default:
            return nil
        }
    }
}
