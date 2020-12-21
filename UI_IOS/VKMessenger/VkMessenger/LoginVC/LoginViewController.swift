import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }

  @IBAction func loginButton(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "SecondController") as UIViewController
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  
  
  @objc func keyboardWasShown(notification: Notification) {
    guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
    let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.size.height, right: 0)
    scrollView.contentInset = insets
  }
  
  
  @objc func keyboardWillBeHidden(notification: Notification) {
      // Устанавливаем отступ внизу UIScrollView, равный 0
      let contentInsets = UIEdgeInsets.zero
      scrollView?.contentInset = contentInsets
  }
}

