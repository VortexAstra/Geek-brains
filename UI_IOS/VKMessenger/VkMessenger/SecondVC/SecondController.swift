//
//  SecondController.swift
//  VkMessenger
//
//  Created by Артем Устинов on 21.12.2020.
//

import UIKit

class SecondController: UIViewController {
  
  @IBOutlet private weak var textLabel: UILabel!
  
  public var textForLabel: String!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textLabel.text = textForLabel
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
}
