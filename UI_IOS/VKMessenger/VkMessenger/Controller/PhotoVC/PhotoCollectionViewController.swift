import UIKit
import RealmSwift

private let reuseIdentifier = "CellForPhoto"

class PhotoCollectionViewController: UICollectionViewController {
    
    var user: User?
    private var realmManager = RealmManager.shared
    
    private lazy var userImages = try? Realm().objects(Photo.self) {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    //    private var userImages: Results<Photo> {
    //        let userImages: Results<Photo>? = realmManager?.getObjects()
    //        return userImages!
    //    }
    
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
        return self.convertToArray(results: userImages).count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell,
            let imgArray = self.userImages?[indexPath.row]
        else { return UICollectionViewCell() }
        
        let img = imgArray.sizes.last
        cell.configure(with: img?.url ?? "")
        return cell
    }
}


extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

extension PhotoCollectionViewController {
    private func convertToArray <T>(results: Results<T>?) -> [T] {
        guard let results = results else { return [] }
        return Array(results)
    }
}
