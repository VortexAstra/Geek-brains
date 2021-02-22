import UIKit

private var cell = "CellForGroup"

class GroupTableViewController: UITableViewController {
    
    
    var myGroups = [Group]() {
        didSet {
            self.filteredGroups = self.myGroups
        }
    }
    var filteredGroups = [Group]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filteredGroups = myGroups
        tableView.rowHeight = 145
        
        let networkService = NetworkManager()
        networkService.loadGroups() { [weak self] groups in
            self?.myGroups = groups
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? GroupTableViewCell{
            cell.nameOfGroup.alpha = 0
            cell.imageViewGroup?.alpha = 0
            cell.imageViewGroup.transform = CGAffineTransform(
                translationX: -self.view.bounds.width / 2,
                y: 0)
            UIView.animate(withDuration: 2,
                           delay: 0.5,
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: {
                            cell.imageViewGroup.transform = .identity
                           },
                           completion: nil)
            UIView.animate(withDuration: 2) {
                cell.imageViewGroup.alpha = 1
                cell.nameOfGroup.alpha = 1
            }
            
            
            let group = self.filteredGroups[indexPath.row]
            cell.config(with: group)
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    @IBAction func unwindFromTableiewController(_ segue: UIStoryboardSegue){
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //            user.group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
}
