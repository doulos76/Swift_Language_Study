//
//  TrackListViewController.swift
//  MyMusicApp
//
//  Created by dave76 on 16/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController {
  
  // - track model
  // - track list
  // - TableViewDelegate, TableViewDatasource
  // - custom TableViewCell
  // - View configuration
  
  var musicTrackList: [Track] = []
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowPlayer" {
      if let playerVC = segue.destination as? PlayerViewController, let index = sender as? Int {
        playerVC.track = musicTrackList[index]
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadTrackList()
  }
  
  func loadTrackList() {
    musicTrackList = [
      Track(title: "Swish", thumbNailImage: #imageLiteral(resourceName: "Believer"), artist: "Tyga"),
      Track(title: "Dip", thumbNailImage: #imageLiteral(resourceName: "Blue Birds"), artist: "Tyga"),
      Track(title: "The Harlem Barber Swing", thumbNailImage: #imageLiteral(resourceName: "The Harlem Barber Swing"), artist: "Jazzinuf"),
      Track(title: "Believer", thumbNailImage: #imageLiteral(resourceName: "Believer"), artist: "Eavee"),
      Track(title: "Blue Birds", thumbNailImage: #imageLiteral(resourceName: "Blue Birds"), artist: "Ariana Grande"),
      Track(title: "Best Mistake", thumbNailImage: #imageLiteral(resourceName: "Best Mistake"), artist: "Ariana Grande"),
      Track(title: "thany u, next", thumbNailImage: #imageLiteral(resourceName: "thank u, next"), artist: "Ariana Grande"),
      Track(title: "7 rings", thumbNailImage: #imageLiteral(resourceName: "7 rings"), artist: "Ariana Grande")
    ]
  }
}

// MARK:- TableView

extension TrackListViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return musicTrackList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TrackCell else {
      return UITableViewCell()
    }
    let track = musicTrackList[indexPath.row]
    cell.thumbnail.image = track.thumbNailImage
    cell.title.text = track.title
    cell.artist.text = track.artist
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("---> \(indexPath.row)")
    performSegue(withIdentifier: "ShowPlayer", sender: indexPath.row)
  }
}
