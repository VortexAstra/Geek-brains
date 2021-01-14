import UIKit

private var cell = "CellForFriend"
var sections = ["A", "B", "C", "D", "E", "F", "G", "H"]



class FriendTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    var filterData: [String] = sections
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        searchBar.delegate = self
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filterData[section]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filterData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var tempArr = [Friend]()
        for index in user.friends{
            if index.name.prefix(1) == filterData[section]{
                tempArr.append(index)
            }
        }
        return tempArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? FriendTableViewCell {
            var tempArr = [Friend]()
            for index in user.friends{
                if index.name.prefix(1) == filterData[indexPath.section]{
                    tempArr.append(index)
                }
            }
            cell.nameOfFriend.text = tempArr[indexPath.row].name
            //photo[0] - Main Photo on screen table
            cell.imageFriend.image = tempArr[indexPath.row].photo[0]
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoCollection" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! PhotoCollectionViewController
                controller.image.append(contentsOf: user.friends[indexPath.row].photo)
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
    
    //    MARK: Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = []
        if searchText == ""{
            filterData = sections
        }
        
        for index in sections{
            if (index.lowercased().contains(searchText.lowercased())){
                filterData.append(index)

            }
        }
        self.tableView.reloadData()
    }
}
