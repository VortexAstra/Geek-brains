import UIKit

private var cell = "CellForFriends"
var sections = ["A", "B", "C", "D", "E", "F", "G", "H"]


class FriendsViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filterData: [String] = sections
    
    @IBOutlet weak var charPicker: CharacterPicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        
        charPicker.Chars = sections
        charPicker.setupUi()
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        // Remove focus from the search bar.
        searchBar.endEditing(true)
    }
    
    @IBAction func panGesturePicker(_ sender: UIGestureRecognizer) {
        let location = sender.location(in: charPicker)
        let coef = Int(charPicker.frame.height) / sections.count
        let letterIndex = Int(location.y) / coef
        if letterIndex < sections.count && letterIndex >= 0 {
            charPicker.selectedChar = sections[letterIndex]
        }
    }
    
    @IBAction func charecterPicker(_ sender: CharacterPicker) {
        let selectedChar = charPicker.selectedChar
        var indexPath = IndexPath(item: 0, section: 0)
        for (index, section) in sections.enumerated() {
            if selectedChar == section {
                indexPath = IndexPath(item: 0, section: index)
            }
        }
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filterData[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var tempArr = [Friend]()
        for index in user.friends{
            if index.name.prefix(1) == filterData[section]{
                tempArr.append(index)
            }
        }
        return tempArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? FriendTableViewCell {
            var tempArr = [Friend]()
            for index in user.friends{
                if index.name.prefix(1) == filterData[indexPath.section]{
                    tempArr.append(index)
                }
            }
            cell.nameOfFriend?.text = tempArr[indexPath.row].name
            cell.imageFriend?.image = tempArr[indexPath.row].photo[0]
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoCollection" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! PhotoCollectionViewController
                controller.image.append(contentsOf: user.friends[indexPath.row].photo)
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(125)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
