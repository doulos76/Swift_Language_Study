//
//  SecondViewController.swift
//  DataTransferExample
//
//  Created by dave76 on 14/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

// MARK:- Protocol
protocol SendBackDelegate {
  func dataReceived(data: String)
}

// MARK:- Class
class SecondViewController: UIViewController {
  

  // MARK:- Properties
  @IBOutlet weak var receivedText: UILabel!
  @IBOutlet weak var textField: UITextField!
  
  var data = ""
  var delegate: SendBackDelegate?
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    receivedText.text = data
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK:- IBAction
  @IBAction func returnWithText(_ sender: Any) {
    delegate?.dataReceived(data: textField.text!)
    dismiss(animated: true, completion: nil)    
  }
}
