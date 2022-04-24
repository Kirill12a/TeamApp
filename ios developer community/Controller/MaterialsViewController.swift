//
//  MaterialsViewController.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 24.04.2022.
//

import UIKit

class MaterialsViewController: UIViewController, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name"
        return cell
    }

    let material = MaterialsViewElements()

    override func loadView() {
        super.loadView()
        self.view = material
        material.table.dataSource = self
        print("fds")
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        print("fds")
    }

}
