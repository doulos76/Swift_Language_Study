//
//  ViewController.swift
//  JsonDecoder
//
//  Created by dave76 on 20/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

struct Course: Decodable {
  let id: Int
  let name: String
  let link: String
  
  let numberOfLessons: Int
  let imageUrl: String
  
//  private enum CodingKeys: String, CodingKey {
//    case imageUrl = "image_url"
//    case numberOfLessons = "number_of_lessons"
//    case id, name, link
//  }
  
}

class CoursesController: UITableViewController {
  
  var courses = [Course]()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Course List "
    
    fetchJSON()
  }

  fileprivate func fetchJSON() {
    let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_snake_case"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, err) in
      DispatchQueue.main.async {
        if let err = err {
          print("Failed to get data from url:", err)
          return
        }
        
        guard let data = data else { return }
        
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          self.courses = try decoder.decode([Course].self, from: data)
          self.tableView.reloadData()
        } catch let jsonErr {
          print("Failed to decode:", jsonErr)
        }
      }
    }.resume()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return courses.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
    let course = courses[indexPath.row]
    cell.textLabel?.text = course.name
    cell.detailTextLabel?.text = String(course.numberOfLessons)
    return cell
  }

}

