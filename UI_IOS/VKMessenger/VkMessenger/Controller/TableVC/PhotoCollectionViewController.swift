import UIKit

private let reuseIdentifier = "CellForPhoto"

class PhotoCollectionViewController: UICollectionViewController {

    var image: UIImage?
    var label: String?

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
            cell.imagePhoto.image = image
            cell.labelPhoto.text = label
            return cell
        }
        return UICollectionViewCell()
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300.0, height: 500.0)
    }
}
