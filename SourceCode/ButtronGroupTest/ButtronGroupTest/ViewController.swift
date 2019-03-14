//
//  ViewController.swift
//  ButtronGroupTest
//
//  Created by dave76 on 14/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var button1: UIButton!
  @IBOutlet weak var button2: UIButton!
  @IBOutlet weak var button3: UIButton!
  

  lazy var buttons: [UIButton] = [button1, button2, button3]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }

  @IBAction func buttonClicked(_ sender: UIButton) {
    buttons.forEach { $0.isSelected = false }
    sender.isSelected = true
  }
  
}

