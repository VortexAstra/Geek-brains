import UIKit
import RealmSwift

private var cell = "CellForGroup"

final class GroupTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet{
            searchBar.delegate = self
            searchBar.showsCancelButton = true
            searchBar.placeholder = "Search by name of group"
        }
    }

    private var searchText: String{
        searchBar.text ?? ""
    }
    
    private var groupToken: NotificationToken?
    private let realm = RealmManager.shared
    
    private lazy var refreshControlTable: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemBlue
        refreshControl.attributedTitle = NSAttributedString(string: "Reload", attributes: [.font: UIFont.systemFont(ofSize: 12)])
        refreshControl.addTarget(self, action: #selector(refresh(_ : )), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func refresh(_ sender: UIRefreshControl) {
        loadData { [weak self] in
            self?.refreshControlTable.endRefreshing()
        }
    }
    
    private var groups: Results<Group>? {
        let group: Results<Group>? = realm?.getObjects()
        return group?.sorted(byKeyPath: "name", ascending: true)
    }
    
    private var filteredGroup: Results<Group>? {
        guard !(searchText.isEmpty) else {
            return groups
        }
        return groups?.filter("name CONTAINS %@", searchText)
    }
    
    fileprivate func loadData(comletion: (()->())? = nil) {
        let networkService = NetworkManager()
        networkService.loadGroups() { [weak self] groups in
            DispatchQueue.main.async {
                try? self?.realm?.add(objects: groups)
                comletion?()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GroupHeader.self, forHeaderFooterViewReuseIdentifier: "GroupHeader")
        tableView.refreshControl = refreshControlTable
        tableView.rowHeight = 150
        createRealmNotification()
        loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredGroup?.count ?? 0
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
            
            
            guard let group = self.filteredGroup?[indexPath.row] else {return UITableViewCell()}
            cell.config(with: group)
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    fileprivate func createRealmNotification() {
        groupToken = groups?.observe({ [weak self] (change) in
            switch change {
            case .initial(_):
                print(self?.groups?.count ?? 0)
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "GroupHeader") as? GroupHeader else { return nil }
        sectionHeader.textLabel?.text = "Group"
        sectionHeader.contentView.backgroundColor = .systemBlue
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let group = filteredGroup?[indexPath.row] else {return}
            try? realm?.delete(object: group)
        }
    }
}

extension GroupTableViewController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.tableView.reloadData()
    }
}
