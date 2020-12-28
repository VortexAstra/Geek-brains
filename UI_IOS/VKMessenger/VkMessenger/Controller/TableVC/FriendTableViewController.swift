import UIKit

private var cell = "CellForFriend"
var group = Group(name: ["Pukabu"], description: ["Da ij"])
var user = User(id: 1, friendImage: [UIImage.init(systemName: "heart.fill")!, UIImage.init(systemName: "moon.fill")!,
    UIImage.init(systemName: "flame.fill")!],
    friends: ["Nikita", "Leva", "Tima"], group: group)

class FriendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? FriendTableViewCell {
            cell.nameOfFriend.text = user.friends[indexPath.row]
            cell.imageFriend.image = user.friendImage[indexPath.row]
            return cell
        }
        return UITableViewCell()
  }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                PhotoCollectionViewController.image  = user.friendImage[indexPath.row]
            case 1:
                PhotoCollectionViewController.image  = user.friendImage[indexPath.row]
            case 2:
                PhotoCollectionViewController.image  = user.friendImage[indexPath.row]
            default:
                break
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "show_photo" else {
//            return
//        }
//        guard let destination = segue.destination as? PhotoCollectionViewController else { return }
//        destination.image = user.friends[indexPath.row]
//    }
    
}
