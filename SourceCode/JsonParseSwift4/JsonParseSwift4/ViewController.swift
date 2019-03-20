//
//  ViewController.swift
//  JsonParseSwift4
//
//  Created by dave76 on 20/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

struct Course {
  let id: Int
  let name: String
  let link: String
  let imageUrl: String
  
  init(json: [String: Any]) {
    id = json["id"] as? Int ?? -1
    name = json["name"] as? String ?? ""
    link = json["link"] as? String ?? ""
    imageUrl = json["imageUrl"] as? String ?? ""
  }
}

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
    guard let url = URL(string: jsonUrlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, err) in
      // perhaps check err
      // also perhaps check response status 200 OK
      print("do stuff here")
      
      guard let data = data else { return }
      let dataAsString = String(data: data, encoding: .utf8)
      print(dataAsString)
      do {
        
        //Swift 2/3/ObjC
        guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
        let course = Course(json: json)
        print(course.name)
      } catch let jsonErr {
        print("Error serializing json:", jsonErr)
      }
    }.resume()
    
//    let myCourse = Course(id: 1, name: "my course", link: "some link", imageUrl: "some image url")
//    print(myCourse)
  }


}

