//
//  PlayerViewController.swift
//  MyMusicApp
//
//  Created by dave76 on 16/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
  
  // MARK:- properties
  @IBOutlet weak var thumbnail: UIImageView!
  @IBOutlet weak var trackTitle: UILabel!
  @IBOutlet weak var artistName: UILabel!
  
  @IBOutlet weak var currentTimeLabel: UILabel!
  @IBOutlet weak var totalDurationTimeLabel: UILabel!
  
  @IBOutlet weak var playPauseButton: UIButton!
  @IBOutlet weak var timeSlider: UISlider!
  
  var track: Track?
  var avplayer: AVPlayer?
  var timeObserver: Any?
  
  var currentTime: Double {
    return avplayer?.currentItem?.currentTime().seconds ?? 0
  }
  
  var totalDurationTime: Double {
    return avplayer?.currentItem?.duration.seconds ?? 0
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  func updateUI() {
    guard let currentTrack = track else { return }
    thumbnail.image = currentTrack.thumbNailImage
    trackTitle.text = currentTrack.title
    artistName.text = currentTrack.artist
    playPauseButton.setImage(#imageLiteral(resourceName: "icPlay"), for: .normal)
  }
  
  func prepareToPlay() {
    guard let currentTrack = track else { return }
    let asset = currentTrack.assert
    let playerItem = AVPlayerItem(asset: asset)
    let player = AVPlayer(playerItem: playerItem)
    avplayer = player
  }
  
  func updateTime(time: CMTime) {
    //print(time.seconds)
    //currentTime label, totaduration label, slider
    currentTimeLabel.text = secondsToString(sec: currentTime) // 3.1234 -> 00:03
    totalDurationTimeLabel.text = secondsToString(sec: totalDurationTime) // 39.2045 >> 00:39
    
    if isSeeking == false {
      timeSlider.value = Float(currentTime / totalDurationTime)
    }
  }
  
  func secondsToString(sec: Double) -> String {
    guard sec.isNaN == false else { return "00:00" }
    let totalSeconds = Int(sec)
    let min = totalSeconds / 60
    let seconds = totalSeconds % 60
    return String(format: "%02d:%02d", min, seconds)
  }
  
  // playback
  func play() {
    avplayer?.play()
  }
  
  func pause() {
    avplayer?.pause()
  }
  
  func seek(to: Double) {
    // to: 0 ~ 1 0.5 * 60 = 30
    let timeScale: CMTimeScale = 10
    let targetTime: CMTimeValue = CMTimeValue(to * totalDurationTime) * CMTimeValue(timeScale)
    let time = CMTime(value: targetTime, timescale: 10)
    avplayer?.seek(to: time)
  }
  
  @IBAction func playButtonTapped(_ sender: UIButton) {
    let isPlaying = avplayer?.rate == 1
    if isPlaying {
      pause()
      playPauseButton.setImage(#imageLiteral(resourceName: "icPlay"), for: .normal)
    } else {
      play()
      playPauseButton.setImage(#imageLiteral(resourceName: "icPause"), for: .normal)
    }
  }
  
  
  var isSeeking = false
  
  @IBAction func dragging(_ sender: UISlider) {
    isSeeking = true
  }
  
  @IBAction func endDragging(_ sender: UISlider) {
    isSeeking = false
    seek(to: Double(sender.value))
  }
  
  @IBAction func close() {
    pause()
    avplayer?.replaceCurrentItem(with: nil)
    avplayer = nil
    
    dismiss(animated: true, completion: nil)
  }
}
