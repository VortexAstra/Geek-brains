//
//  MainTableViewCell.swift
//  HomeWork4
//
//  Created by artem.ustinov on 26.05.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let cellID = "CellID"

    @IBOutlet weak var nameOfTask: UILabel!
    @IBOutlet weak var countOfSubTask: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func configuration(_ task: Taskable,_ indexPath: IndexPath) {
        nameOfTask.text = task.tasks[indexPath.row].name
        countOfSubTask.text = String(task.tasks[indexPath.row].getCountOfSubItem())
    }
}
