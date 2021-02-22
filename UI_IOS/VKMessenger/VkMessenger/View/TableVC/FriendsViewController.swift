import UIKit

private var cell = "CellForFriends"

class FriendsViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var charPicker: CharacterPicker!
    
    var friendsDict: [Character: [User]] = [:]
    var firstLetters = [Character]()
    
    var friends: [User] = [] {
        didSet {
            self.filteredFriends = self.friends
        }
    }
    
    var filteredFriends = [User]() {
        didSet {
            self.friendsDict.removeAll()
            self.firstLetters.removeAll()
            self.fillFriendsDict()
            tableView.reloadData()
        }
    }
    
    
    private func fillFriendsDict() {
        for user in self.filteredFriends {
            let dictKey = user.firstName.first!
            if var users = self.friendsDict[dictKey] {
                users.append(user)
                self.friendsDict[dictKey] = users
            } else {
                self.firstLetters.append(dictKey)
                self.friendsDict[dictKey] = [user]
            }
        }
        self.firstLetters.sort()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        
        self.filteredFriends = self.friends
        tableView.register(FriendsHeader.self, forHeaderFooterViewReuseIdentifier: "FriendsHeader")
        tableView.rowHeight = 125
        
        let networkService = NetworkManager()
        networkService.loadFriends() { [weak self] friends in
            self?.friends = friends
        }
    }
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FriendsHeader") as? FriendsHeader else { return nil }
        
        sectionHeader.textLabel?.text = String(self.firstLetters[section])
        sectionHeader.contentView.backgroundColor = .systemBlue
        return sectionHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.firstLetters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendsDict[self.firstLetters[section]]?.count ?? 0
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        self.firstLetters.map{String($0)}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? FriendTableViewCell {
            
            cell.nameOfFriend.alpha = 0
            cell.imageFriend.alpha = 0
            cell.imageFriend.transform = CGAffineTransform(
                translationX: self.view.bounds.width / 2,
                y: 0)
            UIView.animate(withDuration: 2,
                           delay: 0.5,
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: {
                            cell.imageFriend.transform = .identity
                           },
                           completion: nil)
            UIView.animate(withDuration: 2) {
                cell.imageFriend.alpha = 1
                cell.nameOfFriend.alpha = 1
            }
            let firstLetter = self.firstLetters[indexPath.section]
            if let users = self.friendsDict[firstLetter] {
                cell.configure(with: users[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            filteredFriends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


//    MARK: Search Bar
extension FriendsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty){
            self.filteredFriends = self.friends
            tableView.reloadData()
            return
        }
        self.filteredFriends = self.friends.filter { $0.firstName.lowercased().contains(searchText.lowercased()) }
        self.tableView.reloadData()
    }
}


//  MARK: Segue
extension FriendsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "PhotoCollection",
            let controller = segue.destination as? PhotoCollectionViewController,
            let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let firstLetter = self.firstLetters[indexPath.section]
        
        if let users = self.friendsDict[firstLetter] {
            let user = users[indexPath.row]
            controller.user = user
        }
    }
}
