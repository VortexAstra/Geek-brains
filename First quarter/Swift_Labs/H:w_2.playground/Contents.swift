import UIKit

//MARK: 1
func checkParity(for number: Int) {
  if number % 2 == 0 {
    print("\(number) - четное")
  }
  else {
    print("\(number) - нечетное")
  }
}
checkParity(for: 4)

//MARK: 2
func checkForDivisionByThree(for number: Int) {
  if number % 3 == 0 {
    print("\(number) - делится")
  }
  else {
    print("\(number) - не делится")
  }
}
checkForDivisionByThree(for: 6)

//MARK: 3
var array = [Int]()
for index in 1...100{
  array.append(index)
}
print(array)

//MARK: 4
var newArray = array.filter{$0 % 2 == 0 && $0 % 3 == 0}
print(newArray)

//MARK: 5
func fibonacciArray(_ n: Int) -> [Double] {
  var fibonacci: [Double] = [1, 1] // 1, 1, 2, 3, 5
  (2...n).forEach{ i in
    fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
  }
  return fibonacci
}

print(fibonacciArray(100))

//MARK: 6
func primeNumbers(_ array: [Int]) -> [Int] {
  var primes: [Int] = []
  var newArr = array
  while let newPrime = newArr.first { //until nill
    primes.append(newPrime)
    newArr = newArr.filter { $0 % newPrime != 0 }
  }
  return primes
}

print(primeNumbers(Array(2...100)))
