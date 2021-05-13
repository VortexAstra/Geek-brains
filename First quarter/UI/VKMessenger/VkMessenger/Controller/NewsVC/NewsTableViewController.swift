import UIKit

final class NewsTableViewController: UITableViewController {
    
    var news: [News]? {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NewsTableViewCell.nib, forCellReuseIdentifier: NewsTableViewCell.identifer)
        tableView.rowHeight = 120
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let networkManager = NetworkManager()
        networkManager.loadNews { [weak self] (news) in
            self?.news = news
        }
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return news?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifer, for: indexPath) as? NewsTableViewCell{
            guard let news = news?[indexPath.row] else {return NewsTableViewCell()}
            
            cell.configure(for: news)
            return cell
        }
        return UITableViewCell()
    }
}
