//
//  DetailController.swift
//  CollectionViewPractice
//
//  Created by dave76 on 12/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class DetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "cellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .green
    collectionView.register(ItemCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
//    collectionView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCell
    cell.titleLabel.text = "\(indexPath.row)"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 100)
  }
}
