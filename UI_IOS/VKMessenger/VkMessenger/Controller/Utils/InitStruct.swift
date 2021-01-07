import UIKit


var friend = Friend(id: 1, name: "Eva", photo: [UIImage.init(named: "6")!, UIImage.init(named: "15")!])
var friend1 = Friend(id: 2, name: "Timon", photo:
                        [UIImage.init(named: "15")!,
                         UIImage.init(named: "6")!])


var group = Group(name: "Pika4u group", description: "asdasd", image: UIImage.init(named: "2")!)
var group1 = Group(name: "Angry Birds group", description: "q", image: UIImage.init(named: "3")!)
var group2 = Group(name: "Third", description: "w", image: UIImage.init(systemName: "flame.fill")!)
var group3 = Group(name: "Fourth", description: "e", image: UIImage.init(systemName: "flame.fill")!)
var group4 = Group(name: "Fifth", description: "r", image: UIImage.init(systemName: "flame.fill")!)
var group5 = Group(name: "Sixth", description: "t", image: UIImage.init(systemName: "flame.fill")!)


var user = User(id: 1, name: "Ustinov Artyom", image: [UIImage.init(named: "1")!], friends: [friend, friend1], group: [group, group1])

