import UIKit

private var cell = "CellForAllGroup"

class AllGroupTableViewController: UITableViewController {
    
    var allGroup = Group(name: ["Avito", "OK", "Twitter"], description: ["Kruto", "Super", "Neploho"])

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroup.name.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? AllGroupTableViewCell{
            cell.groupName.text = allGroup.name[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
}
