//
//  Track.swift
//  MyMusicApp
//
//  Created by dave76 on 16/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit
import AVFoundation

class Track {
  var title: String
  var thumbNailImage: UIImage
  var artist: String
  
  init(title: String, thumbNailImage: UIImage, artist: String) {
    self.title = title
    self.thumbNailImage = thumbNailImage
    self.artist = artist
  }
  
  var assert: AVAsset {
    let path = Bundle.main.path(forResource: title, ofType: "mov")!
    let url = URL(fileURLWithPath: path)
    let asset = AVAsset(url: url)
    return asset
  }
}
