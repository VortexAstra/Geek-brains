import UIKit

func bubleSort(array: inout [Int]) {
    for i in 1..<array.count {
        print(i)
        for j in 0..<i where array[j] > array[j+1] {
            array.swapAt(j, j+1)
            print(j)
        }
    }
}
var arr = [1, 8, 2, 9]
bubleSort(array: &arr)


func binarySearch<T:Comparable>(inputArr:Array<T>, searchItem: T) -> Int? {
    var lowerIndex = 0;
    var upperIndex = inputArr.count - 1

    while (true) {
        let currentIndex = (lowerIndex + upperIndex)/2
        if(inputArr[currentIndex] == searchItem) {
            return currentIndex
        } else if (lowerIndex > upperIndex) {
            return nil
        } else {
            if (inputArr[currentIndex] > searchItem) {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
}

var myArray = [1,2,3,4,5,6,7,9,10];

if let searchIndex = binarySearch(inputArr: myArray,searchItem: 5){
    print("Element found on index: \(searchIndex)");
}
