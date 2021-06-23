import UIKit

func decimalЕoBinary(value: Int) {
    if ((value) != 0) {
        decimalЕoBinary(value: value >> 1);
        print(value & 1);
    }
}

func binpow(_ a: Int,_ b: Int) -> Int{
    if (b == 0) {
        return 1
    }
    if (b % 2 == 1) {
        return binpow(a, b - 1) * a
    } else {
        let c = binpow(a, b / 2);
        return c * c;
    }
}

decimalЕoBinary(value: 2)
print(binpow(2, 5))
