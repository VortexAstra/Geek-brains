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
        return user.group.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? GroupTableViewCell{
            cell.nameOfGroup.text = user.group[indexPath.row].name
            cell.imageViewGroup.image =  user.group[indexPath.row].image 
            return cell
        }
        
        return UITableViewCell()
    }
    
    @IBAction func unwindFromTableiewController(_ segue: UIStoryboardSegue){
        guard let tableVC = segue.source as? AllGroupTableViewController, let indexPath = tableVC.tableView.indexPathForSelectedRow else {
            return
        }
        let newGroup = tableVC.allGroup[indexPath.row]
        for index in user.group{
            guard index.name != newGroup.name else {return}
        }
        user.group.append(newGroup)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            user.group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
}
