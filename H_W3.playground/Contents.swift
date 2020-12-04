import UIKit

enum Action {
  case turnedOff, turnedOn, openWindow, closeWindow, putInTheTrunk(Int), takeInTheTrunk(Int)
}

struct SportCar{
  var mark: String
  var yearOfIssue: Int
  var engineStarted: Bool
  var windowsOpen: Bool
  var maxSizeTrunk: Int
  var sizeTrunk: Int = 0
  var fullTrunk: Bool = false
  
  init(mark: String, yearOfIssue: Int, engineStarted: Bool, windowsOpen: Bool, maxSizeTrunk: Int) {
    self.mark = mark
    self.yearOfIssue = yearOfIssue
    self.engineStarted = engineStarted
    self.windowsOpen = windowsOpen
    self.maxSizeTrunk = maxSizeTrunk
  }
  
  mutating func action(action: Action) {
    switch action {
      case .closeWindow:
        self.windowsOpen = false
        print(windowsOpen)
      case .openWindow:
        self.windowsOpen = true
        print(windowsOpen)
      case .turnedOff:
        engineStarted = false
        print(engineStarted)
      case .turnedOn:
        engineStarted = true
        print(engineStarted)
      case .putInTheTrunk(let size):
        sizeTrunk = sizeTrunk + size
        if (sizeTrunk > maxSizeTrunk){
          print("Full")
        }
        else {
          print(sizeTrunk)
        }
      
      case .takeInTheTrunk(let size):
        sizeTrunk = sizeTrunk - size
        print(sizeTrunk)
    }
  }
}



var car = SportCar(mark: "Ausi", yearOfIssue: 2020, engineStarted: true, windowsOpen: false, maxSizeTrunk: 1000)
car.action(action: .putInTheTrunk(10))
car.action(action: .putInTheTrunk(900))
car.action(action: .takeInTheTrunk(100))

