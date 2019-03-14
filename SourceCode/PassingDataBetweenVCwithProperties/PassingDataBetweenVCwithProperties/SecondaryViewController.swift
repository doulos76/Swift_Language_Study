//
//  SecondaryViewController.swift
//  PassingDataBetweenVCwithProperties
//
//  Created by dave76 on 14/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class SecondaryViewController: UIViewController {
  
  var text: String = ""
  
  @IBOutlet weak var textLabel: UILabel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textLabel?.text = text
  }
}
