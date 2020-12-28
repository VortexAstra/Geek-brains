import UIKit

class SecondController: UIViewController {
  
  public var textForLabel: String!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
}
