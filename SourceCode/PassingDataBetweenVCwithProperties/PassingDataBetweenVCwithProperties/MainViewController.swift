//
//  MainViewController.swift
//  PassingDataBetweenVCwithProperties
//
//  Created by dave76 on 14/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  var textString: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func onButtonTap(_ sender: Any) {
    let vc = SecondaryViewController(nibName: "SecondaryViewController", bundle: nil)
    vc.text = "Next label blog photo booth, tousled authentic tote bag kogi"
    navigationController?.pushViewController(vc, animated: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is TertiaryViewController {
      let vc = segue.destination as? TertiaryViewController
      vc?.userName = "Arthur Dent"
    }
  }
  
}

