import UIKit

private let reuseIdentifier = "CellForPhoto"

class PhotoCollectionViewController: UICollectionViewController {
    static var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell{
            cell.imagePhoto.image = PhotoCollectionViewController.image
            return cell
        }
        return UICollectionViewCell()
    }
}
