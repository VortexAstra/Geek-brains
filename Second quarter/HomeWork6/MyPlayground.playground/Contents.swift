import UIKit

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee: Coffee {
    var cost: Int {
        return 100
    }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class CoffeeWithMilk: CoffeeDecorator {
    var cost: Int {
        return base.cost + 50
    }
    var base: Coffee

    required init(base: Coffee) {
        self.base = base
    }

}

class CoffeeWithWhip: CoffeeDecorator {
    var cost: Int {
        print(base.cost)
        return base.cost + 70
    }

    var base: Coffee

    required init(base: Coffee) {
        self.base = base
    }
}

class CoffeeWithSugar: CoffeeDecorator {
    var cost: Int {
        print(self.cost)
        return base.cost + 80
    }

    var base: Coffee

    required init(base: Coffee) {
        self.base = base
    }
}

print("$$$$$", 1)

var simpleCoffee = SimpleCoffee()
var typeC = type(of: simpleCoffee)
var coffeeWithMilk = CoffeeWithMilk(base: simpleCoffee)
coffeeWithMilk.cost
var coffeeWithWhip = CoffeeWithWhip(base: simpleCoffee)
coffeeWithWhip.cost
var coffeeWithSugar = CoffeeWithSugar(base: simpleCoffee)
coffeeWithSugar.cost
