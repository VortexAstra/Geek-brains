import UIKit

private var cell = "CellForAllGroup"

class AllGroupTableViewController: UITableViewController {
    
//    var allGroup = [group, group1, group3, group4, group5]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? AllGroupTableViewCell{
//            cell.groupName.text = allGroup[indexPath.row].name
//            cell.groupImage.image = allGroup[indexPath.row].image
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
}
