import UIKit
import Foundation

enum MyError: String, Error {
    case discriminantIsLowerZero = "Discriminant is lower zero"
}

class QuadraticEquation {
  var a, b, c: Double
  
  init(a: Double, b: Double, c: Double) {
    self.a = a
    self.b = b
    self.c = c
  }
  
  func solve() throws -> [Double] {
    let discriminant = pow(b, 2) - 4 * a * c
    guard discriminant > 0 else {throw MyError.discriminantIsLowerZero}
    let x1 = (-b + sqrt(discriminant))/(2 * a)
    let x2 = (-b - sqrt(discriminant))/(2 * a)
    return [x1, x2]
  }
}

let equation1 = QuadraticEquation(a: 2, b: 3, c: 5)
if let answer = try? equation1.solve(){
  print(answer)
}else{
  print(MyError.discriminantIsLowerZero.rawValue)
}

//do catch
do{
  let answer = try QuadraticEquation(a: 2, b: 3, c: -5).solve()
  print(answer)
} catch is MyError{
  print("Error - discriminant is lower zero")
}
