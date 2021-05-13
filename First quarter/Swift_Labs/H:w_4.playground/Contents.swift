import UIKit

protocol Car{
  var mark: String {get}
  var horsePower: Double {get}
  var maxSpeed: Double {get}
  var year: Int {get}
  var engineStatus: Bool {get}
  
  func start()
}

enum MarkOfSportCar {
  case lambo, ferra
}

class TrunkCar: Car{
  
  var horsePower: Double
  var mark: String
  var maxSpeed: Double
  var year: Int
  var engineStatus: Bool = false
  
  
  init(mark: String, maxSpeed: Double, year: Int, horsePower: Double, engineStatus: Bool) {
    self.mark = mark
    self.maxSpeed = maxSpeed
    self.year = year
    self.horsePower = horsePower
    self.engineStatus = engineStatus
    
  }
  
  func start() {
    self.engineStatus = true
    print("Let's Go")
  }
}

class SportCar: Car{
  var horsePower: Double
  var mark: String
  var maxSpeed: Double
  var year: Int
  var engineStatus: Bool = false
  
  var spoiler: Bool = true
  
  init(mark: String, maxSpeed: Double, year: Int, horsePower: Double) {
    self.mark = mark
    self.maxSpeed = maxSpeed
    self.year = year
    self.horsePower = horsePower
  }
  
  func start() {
    self.engineStatus = true
    print("У нас спорткар и мы поехали")
  }
//  метод очень странный, но идей не было, но я разбираюсь)0
  func checkMark(mark: MarkOfSportCar) {
    switch mark {
      case .ferra:
        print("У нас феррари")
      case .lambo:
        print("У нас ламборджини")
    }
  }
}

let car = SportCar(mark: "Lamba", maxSpeed: 2000, year: 2020, horsePower: 1000)
car.start()
car.checkMark(mark: .ferra)

