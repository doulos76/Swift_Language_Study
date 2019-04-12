//
//  ItemCell.swift
//  CollectionViewPractice
//
//  Created by dave76 on 12/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "1"
    label.textColor = .black
    label.font = .systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setupView()
    setupLayout()
  }
  
  fileprivate func setupView() {
    titleLabel.textAlignment = .center    
  }
  
  fileprivate func setupLayout() {
    addSubview(titleLabel)
    titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    titleLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
