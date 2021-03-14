import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
  
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else {return}
        Auth.auth().signIn(withEmail: login, password: password) { [weak self] (result, error) in
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
            }
            else{
                self.performSegue(withIdentifier: "secondScreen", sender: nil)
            }
        }
        
    }
    
    @IBAction func registrationButton(_ sender: Any) {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else {return}
        Auth.auth().createUser(withEmail: login, password: password) { [weak self] (result, error) in
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
            }
            else{
                self.performSegue(withIdentifier: "secondScreen", sender: nil)
            }
        }
    }
}

