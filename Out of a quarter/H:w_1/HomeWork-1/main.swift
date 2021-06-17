//
//  main.swift
//  HomeWork-1
//
//  Created by artem.ustinov on 13.06.2021.
//

import Foundation

//artem.ustinov

// MARK:  Ввести вес и рост человека. Рассчитать и вывести индекс массы тела по формуле I=m/(h*h); где m-масса тела в килограммах, h - рост в метрах.
class Human {
    var height, mass: Double
    var BMI: Double {
        mass /  pow(height, 2)
    }

    init(height: Double, mass: Double) {
        self.height = height
        self.mass = mass
    }
}

print("Enter height in meters")
let height = readLine()
print("Enter mass in killi")
let mass = readLine()

if let height = height, let mass = mass {
    if let doubleHeight = Double(height), let doubleMass = Double(mass) {
        let human = Human(height: doubleHeight, mass: doubleMass)
        let multiplier =  pow(10.0, 3.0)
        let roundedBMI = round(human.BMI * multiplier) / multiplier
        print(roundedBMI)
    }
}

// MARK: Найти максимальное из четырех чисел. Массивы не использовать.
// MARK: HARDCODE CONST VALUE

var firstValue = 1
var secondValue = 11
var thirdValue = 5
var fourthValue = 7

var max = firstValue

if (secondValue > max) {
    max = secondValue
}
if (thirdValue > max) {
    max = thirdValue
}
if (fourthValue > max) {
    max = fourthValue
}

print("Max value - \(max)")

//MARK: Написать программу обмена значениями двух целочисленных переменных:

// MARK: Variant 1
var first_value = 1
var second_value = 2
var temp: Int?

temp = first_value
first_value = second_value
second_value = temp!
print("""
    Example
First value \(first_value)
Second value \(second_value)
Tempo value \(temp!)
""")

// MARK: Variant 2
var a = 2
var b = 4
(a, b) = (b, a)
print("a - \(a)  b - \(b)")

// MARK: Variant 3
var testVar1 = 2
var testVar2 = 4
testVar1 = testVar1 + testVar2
testVar2 = testVar1 - testVar2
testVar1 = testVar1 - testVar2
print("First value", testVar1, "\nSecond value", testVar2)


//MARK: Написать функцию нахождения максимального из трех чисел.

func findingMaximumOfThreeNumbers<T: Comparable>(firstValue: T, secondValue: T, thirdValue: T) -> T {
    var max = firstValue

    if (secondValue > max) {
        max = secondValue
    }

    if (thirdValue > max) {
        max = thirdValue
    }

    return max
}
var answer = findingMaximumOfThreeNumbers(firstValue: 3.0, secondValue: 3.5, thirdValue: 4)
print(answer)


//MARK: 13. * Написать функцию, генерирующую случайное число от 1 до 100.
print(arc4random_uniform(100))
print(Int.random(in: 0..<100))

enum SolveError: Error {
    case dIsLessThanZero
}

//MARK: Solve quadratic equation
func solveQuadraticEquation<T: FloatingPoint>(a: T, b: T, c: T) throws -> [T] {
    let D = b * b - 4 * a * c
    if (D > 0) {
        let x1 = (-b + sqrt(D)) / (2 * a)
        let x2 = (-b - sqrt(D)) / (2 * a)
        return [x1, x2]
    } else {
        throw SolveError.dIsLessThanZero
    }
}

do {
    print(try solveQuadraticEquation(a: 1, b: 4, c: 600))
} catch let error{
    print(error)
}
