import UIKit

// Queue

// - The Main Queue
DispatchQueue.main.async {
  // UI update
  let view = UIView()
  view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}


// - Global Queue
DispatchQueue.global(qos: .userInitiated).async {
  // 0.1 - 1 sec 사이 작업
}

DispatchQueue.global(qos: .userInitiated).async {
  // 2 - 10 sec 사이 작업
}

// 거의 사용 안함
//DispatchQueue.global(qos: .default).async {
//  // 2 - 10 sec 사이 작업
//}

DispatchQueue.global(qos: .utility).async {
  // 5 - 10 min 사이 작업
}

DispatchQueue.global(qos: .background).async {
  // 30 min - 1 hour 그 이상의 작업
}


// Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)

// Async, Sync

// - Async

//DispatchQueue.global(qos: .background).async {
//  for i in 0...5 {
//    print("👿 \(i)")
//  }
//}
//
//DispatchQueue.global(qos: .userInteractive).async {
//  for i in 0...5 {
//    print("😢 \(i)")
//  }
//}

// - Sync

DispatchQueue.global(qos: .background).sync {
  for i in 0...5 {
    print("👿 \(i)")
  }
}

DispatchQueue.global(qos: .userInteractive).async {
  for i in 0...5 {
    print("😢 \(i)")
  }
}
