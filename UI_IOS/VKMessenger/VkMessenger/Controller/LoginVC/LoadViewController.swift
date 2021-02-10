import UIKit

class LoadViewController: UIViewController {
    
    var loadingProgressBar = ProgressItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loadingProgressBar)
        
        loadingProgressBar.translatesAutoresizingMaskIntoConstraints = false
        
        loadingProgressBar.shape2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loadingProgressBar.shape2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        progressBarAnimation()
    }
    
    func progressBarAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.repeat, .autoreverse]) {
            self.loadingProgressBar.shape1.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [.repeat, .autoreverse]) {
            self.loadingProgressBar.shape2.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.9, options: [.repeat, .autoreverse]) {
            self.loadingProgressBar.shape3.alpha = 1
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sleep(5)
        performSegue(withIdentifier: "loading_to_login", sender: self)
    }
        
    
}

