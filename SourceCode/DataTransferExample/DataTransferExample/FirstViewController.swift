//
//  FirstViewController.swift
//  DataTransferExample
//
//  Created by dave76 on 14/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  // MARK:- Properties
  @IBOutlet weak var receivedText: UILabel!
  @IBOutlet weak var textField: UITextField!
  
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  // MARK:- Methods
  @IBAction func sendText(_ sender: UIButton) {
    performSegue(withIdentifier: "showSecondView", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showSecondView" {
      let secondVC = segue.destination as! SecondViewController
      secondVC.data = textField.text!
      secondVC.delegate = self
    }
  }
  
}

extension FirstViewController: SendBackDelegate {
  func dataReceived(data: String) {
    receivedText.text = data
  }
}
