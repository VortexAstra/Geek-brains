import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet private weak var loginTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  @IBOutlet private weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    switch identifier {
      case "to_second_vc":
        let result = checkUserData()
        if !(result) {
          showAlert()
        }
        return result
      default:
        break
    }
    return false
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  @IBAction func loginButton(_ sender: UIButton) {
    
  }
  
  func checkUserData() -> Bool {
    loginTextField.text == "A" && passwordTextField.text == "4"
  }
  
  func showAlert(){
    let alert = UIAlertController(title: "Error", message: "Incorrect", preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(alertAction)
    present(alert, animated: true, completion: nil)
  }
  
  
  
  @objc func keyboardWasShown(notification: Notification) {
    guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
    let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.size.height, right: 0)
    scrollView.contentInset = insets
  }
  
  
  @objc func keyboardWillBeHidden(notification: Notification) {
    let contentInsets = UIEdgeInsets.zero
    scrollView?.contentInset = contentInsets
  }
}

