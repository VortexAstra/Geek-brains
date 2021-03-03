import UIKit

private let reuseIdentifier = "CellForPhoto"

class PhotoCollectionViewController: UICollectionViewController {
    
    var user: User?
    
    var userImages = [String]() {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkService = NetworkManager()
        
        if let userId = self.user?.id {
            networkService.loadPhotos(for: userId) { [weak self] photos in
                self?.userImages = photos.compactMap { $0.sizes?[$0.sizes!.count - 1].url }
            }
        }
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell{
            let img = self.userImages[indexPath.row]
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
