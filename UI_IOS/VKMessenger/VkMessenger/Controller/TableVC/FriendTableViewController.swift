import UIKit

private var cell = "CellForFriend"

    
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
            let count = user.friends[indexPath.row].photo.count
            cell.nameOfFriend.text = user.friends[indexPath.row].name
            cell.imageFriend.image = user.friends[indexPath.row].photo[count - 1]
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoCollection" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! PhotoCollectionViewController
                let count = user.friends[indexPath.row].photo.count
                controller.image = user.friends[indexPath.row].photo[count - 1]
                controller.label = user.friends[indexPath.row].name

            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(95)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            user.friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }    
}
