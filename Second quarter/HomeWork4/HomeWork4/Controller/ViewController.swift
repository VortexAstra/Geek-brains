//
//  ViewController.swift
//  HomeWork4
//
//  Created by artem.ustinov on 26.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = 60
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    var task: Taskable?

//	MARK: LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        task = Task(name: "First Task")
		title = task?.name
    }


	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
	}



    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Task", message: "✌️", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Write task..."
        }

        let aletActionCreate = UIAlertAction.init(title: "Create", style: .default) {[weak self] alertAction in
            guard let self = self, let alertTextField = alert.textFields?[0] else { return }
            if alertTextField.text != "" {
                self.task?.tasks.append(SubTask(name: alertTextField.text ?? ""))
                self.tableView.reloadData()
            }
        }

        let alertActionCancel = UIAlertAction.init(title: "Cancel", style: .cancel)

        alert.addAction(aletActionCreate)
        alert.addAction(alertActionCancel)

        present(alert, animated: true)
    }
}

// MARK: TABLE DELEGATE

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task?.tasks.count ?? .zero
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
		if let vc = storyboard?.instantiateViewController(withIdentifier: "TaskList") as? ViewController {
			vc.task = (task?.tasks[indexPath.row])!
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: DATA SOURCE

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as? MainTableViewCell {
            if let task = task {
                cell.configuration(task , indexPath)
                return cell
            }
        }
        return UITableViewCell()
    }
}

