import UIKit;
import Foundation

class Queue<T: Equatable>: CustomStringConvertible  {
  var description: String{
    return "\(queue)"
  }
  
  private var queue: [T] = []
  
  func push(_ element: T) -> Void {
    queue.append(element)
  }
  
  func poll() -> T? {
    guard queue.count > 0 else { return nil }
    return queue.removeFirst()
  }
  
  func peek() -> T? {
    guard queue.count > 0 else { return nil }
    return queue.first
  }
  
  func filter(closure: (T) -> Bool) -> [T] {
    var arrayTemp: [T] = []
    
    for index in queue {
      if closure(index){
        arrayTemp.append(index)
      }
    }
    return arrayTemp
  }
  
  subscript(indecies: UInt...) -> Double{
    var weight = 0.0
    for index in indecies where index < self.queue.count {
      weight += 2.0
    }
    return weight
  }
}

let queue = Queue<Int>()
queue.push(1)
queue.push(2)
queue.push(4)
queue.push(6)
print(queue)
queue.poll()
queue.push(5)

print(queue.filter(closure: { (element: Int) -> Bool in
  return element % 2 == 0
}))

queue[3]
