import UIKit
import RealmSwift

private let reuseIdentifier = "CellForPhoto"

class PhotoCollectionViewController: UICollectionViewController {
    
    var user: User?
    private var realmManager = RealmManager.shared
    
    var userImages = [String]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private var image: Results<Photo>?{
        let image: Results<Photo>? = realmManager?.getObjects()
        return image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }
    
    func loadData(comletion: (() -> ())? = nil ) {
        let networkService = NetworkManager()
        
        if let userId = self.user?.id {
            networkService.loadPhotos(for: userId) { [weak self] photos in
                DispatchQueue.main.async {
                    try? self?.realmManager?.add(objects: photos)
                    comletion?()
                }
            }
        }
        comletion?()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell{
            let img = userImages[indexPath.row]
            cell.configure(with: img)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}
