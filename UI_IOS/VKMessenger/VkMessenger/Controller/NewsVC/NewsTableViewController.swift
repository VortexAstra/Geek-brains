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
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.rowHeight = 300
    }
    
    fileprivate func loadNews(comletion: (() -> ())? = nil ) {
        let networkManager = NetworkManager()
        DispatchQueue.main.async {
            networkManager.loadNews { [weak self] (news) in
                self?.news = news
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNews()
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return news?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "News"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifer, for: indexPath) as? NewsTableViewCell{
            guard let news = news?[indexPath.row] else {return NewsTableViewCell()}
            
            DispatchQueue.main.async {
                cell.configure(for: news)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func refresh(sender:AnyObject) {
        loadNews(){ [weak self] in
            self?.refreshControl!.endRefreshing()
        }
    }
    
    
}
