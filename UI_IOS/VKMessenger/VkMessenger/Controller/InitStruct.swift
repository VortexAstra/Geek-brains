import UIKit


var friend = Friend(id: 1, name: "Eva", photo: [UIImage.init(named: "6")!, UIImage.init(named: "15")!])
var friend1 = Friend(id: 2, name: "Artyom1", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!,
                         UIImage.init(named: "6")!,
                         UIImage.init(named: "6")!,
                         UIImage.init(named: "6")!,
                         UIImage.init(named: "6")!,
                         UIImage.init(named: "6")!,
                         UIImage.init(named: "6")!])
var friend2 = Friend(id: 3, name: "Timon", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend3 = Friend(id: 4, name: "Nikitos", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend4 = Friend(id: 5, name: "Petrov", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend5 = Friend(id: 6, name: "Vika", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend6 = Friend(id: 7, name: "Artyom2", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend7 = Friend(id: 8, name: "Bory", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend8 = Friend(id: 9, name: "Ceny", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend9 = Friend(id: 10, name: "Dima", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend10 = Friend(id: 11, name: "Finli", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend11 = Friend(id: 12, name: "Grek", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])
var friend12 = Friend(id: 13, name: "Heroes", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])


var group = Group(name: "Pika4u group", description: "asdasd", image: UIImage.init(named: "2")!)
var group1 = Group(name: "Angry Birds group", description: "q", image: UIImage.init(named: "3")!)
var group2 = Group(name: "Third", description: "w", image: UIImage.init(systemName: "flame.fill")!)
var group3 = Group(name: "Fourth", description: "e", image: UIImage.init(systemName: "flame.fill")!)
var group4 = Group(name: "Fifth", description: "r", image: UIImage.init(systemName: "flame.fill")!)
var group5 = Group(name: "Sixth", description: "t", image: UIImage.init(systemName: "flame.fill")!)


var user = User(id: 1, name: "Ustinov Artyom",
                image: [UIImage.init(named: "1")!],
                friends: [friend, friend1, friend2, friend3, friend4, friend5,
                          friend6, friend7, friend8, friend9, friend10, friend11,
                          friend12],
                group: [group, group1])

