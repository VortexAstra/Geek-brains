import RealmSwift
import UIKit

private var cell = "CellForFriends"

class FriendsViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    private var realmManager = RealmManager.shared
    private var friendToken: NotificationToken?
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.refreshControl = refreshControl
            tableView.register(FriendsHeader.self, forHeaderFooterViewReuseIdentifier: "FriendsHeader")
            tableView.rowHeight = 125
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet {
            searchBar.delegate = self
            searchBar.showsCancelButton = true
        }
    }
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemBlue
        refreshControl.attributedTitle = NSAttributedString(string: "Reload", attributes: [.font: UIFont.systemFont(ofSize: 12)])
        refreshControl.addTarget(self, action: #selector(refresh(_ : )), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func refresh(_ sender: UIRefreshControl) {
        loadData { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
    
    private var searchText: String {
        searchBar.text ?? ""
    }
    
    private var users: Results<User>? {
        let users: Results<User>? = realmManager?.getObjects()
        return users?.sorted(byKeyPath: "firstName", ascending: true)
    }
    
    private var filteredUsers: Results<User>? {
        guard !(searchText.isEmpty) else {
            return users
        }
        return users?.filter("firstName CONTAINS %@", searchText)
    }
    
    deinit {
        friendToken?.invalidate()
    }
    
    //    MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        createRealmNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }
    
    fileprivate func createRealmNotification() {
        friendToken = users?.observe({ [weak self] (change) in
            switch change {
            case .initial(_):
                print(self?.users?.count ?? 0)
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: _):
                self?.tableView.beginUpdates()
                
                let deletionsIndexPath = deletions.map{IndexPath(row: $0, section: 0)}
                let insertionsIndexPath = insertions.map{IndexPath(row: $0, section: 0)}
                
                self?.tableView.insertRows(at: insertionsIndexPath, with: .fade)
                self?.tableView.deleteRows(at: deletionsIndexPath, with: .automatic)
                
                self?.tableView.endUpdates()
            case .error(let error):
                print(error)
            }
        })
    }
    
    
    private func loadData(comletion: (()->())? = nil){
        let networkService = NetworkManager()
        networkService.loadFriends() { [weak self] friends in
            DispatchQueue.main.async {
                try? self?.realmManager?.add(objects: friends)
                comletion?()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FriendsHeader") as? FriendsHeader else { return nil }
        
        sectionHeader.textLabel?.text = "Friends"
        sectionHeader.contentView.backgroundColor = .systemBlue
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredUsers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? FriendTableViewCell {
            
            cell.nameOfFriend.alpha = 0
            cell.imageFriend.alpha = 0
            cell.imageFriend.transform = CGAffineTransform(
                translationX: self.view.bounds.width / 2,
                y: 0)
            
            UIView.animate(withDuration: 1.5,
                           delay: 0.3,
                           usingSpringWithDamping: 0.8,
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
            
            guard let user = filteredUsers?[indexPath.row] else {return UITableViewCell()}
            cell.configure(with: (user))
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            guard let user = filteredUsers?[indexPath.row] else {return}
            do{
                try realmManager?.delete(object: user)
            }catch(let error){
                print(error.localizedDescription)
            }
            
        }
    }
}



//    MARK: Search Bar
extension FriendsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
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
        
        
        let user = users?[indexPath.row]
        controller.user = user
        
    }
}
