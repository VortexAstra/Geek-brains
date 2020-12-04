import UIKit

//quadratic solution
//можно try catch еще сделать, для нуля и еще случай для перехода к линейному но задача решить квадратное)
func solveSquare(_ a: Double, _ b: Double,_ c: Double) -> (Double, Double) {

  let discriminant = pow(b, 2) - (4 * a * c)
  return ((-b + sqrt(discriminant))/(2 * a),
          (-b - sqrt(discriminant))/(2 * a))
}

print(solveSquare(1, -8, 12))

// finding the area
func findArea(_ a: Double, _ b: Double) -> (Double, Double, Double) {
  return (1/2 * a * b,
          a + b + sqrt(pow(a, 2) + pow(b, 2)),
          sqrt(pow(a, 2) + pow(b, 2)))
}

print(findArea(3, 4))

//Bank
func finding_the_full_amount(summa: Double, percent: Double) -> (Double) {
  let age = 5.0
  let percentage_of_enrollment = percent + 1
  let finalSumma: Double = summa * pow(percentage_of_enrollment, age)
  return finalSumma
}

print(finding_the_full_amount(summa: 1000, percent: 0.2))

