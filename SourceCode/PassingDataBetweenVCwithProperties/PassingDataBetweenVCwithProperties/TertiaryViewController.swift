//
//  TertiaryViewController.swift
//  PassingDataBetweenVCwithProperties
//
//  Created by dave76 on 14/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class TertiaryViewController: UIViewController {
  
  var userName: String = ""
  @IBOutlet weak var userNameLabel: UILabel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    userNameLabel?.text = userName
  }
}
