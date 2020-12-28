import UIKit

private var cell = "CellForGroup"

class GroupTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.group.name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? GroupTableViewCell{
            cell.nameOfGroup.text = user.group.name[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    @IBAction func unwindFromTableiewController(_ segue: UIStoryboardSegue){
        guard let tableVC = segue.source as? AllGroupTableViewController, let indexPath = tableVC.tableView.indexPathForSelectedRow else {
            return
        }
        let newGroup = tableVC.allGroup.name[indexPath.row]
        if user.group.name.contains(newGroup){return}
        user.group.name.append(newGroup)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            user.group.name.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
