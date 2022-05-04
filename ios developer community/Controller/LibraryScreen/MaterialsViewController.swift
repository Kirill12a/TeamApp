//
//  MaterialsViewController.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 28.04.2022.
//

import Foundation
import UIKit


final class MaterialsViewController: UIViewController {

    static var singltone = MaterialsViewController()
    // private init

    private lazy var mainView = MaterialsView()

    // Это данные для collectionView
    // хз тут это нужно делать или нет.
    let mainMaterialsName = [MainMaterialModel(name: "Apple Doka"), MainMaterialModel(name: "Swift Book")]

    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bg")
        setupNavController()

        mainView.collectionView.delegate        = self
        mainView.collectionView.dataSource      = self

        mainView.ourMaterialsTable.delegate     = self
        mainView.ourMaterialsTable.dataSource   = self


    }




    @objc func cellTouch(){

        let collectionVC = DetaiInformation ()
        navigationController?.pushViewController(collectionVC, animated: true)

    }

    private func setupNavController() {
        title = "Материалы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 40, weight: .bold)
        ]
    }
}

//MARK: - CollectionView
extension MaterialsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize{
        return CGSize(width: view.frame.width - 33,  height: view.frame.height / 17 )
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MaterialsViewController.singltone.mainMaterialsName.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionView

        cell.nameLabel.text = MaterialsViewController.singltone.mainMaterialsName[indexPath.row].name
        cell.destinationImage.image = UIImage(named: "cell")

        cell.layer.cornerRadius = 12.0
        cell.backgroundColor = UIColor(red: 0.788, green: 0.8, blue: 0.82, alpha: 0.24)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:5, left: 16, bottom: 10, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellTouch()
    }
}

//MARK: - TableView
extension MaterialsViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        OurMaterials.allCases.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = UITableViewCell()

        cell.textLabel?.text = OurMaterials.allCases[index].rowTitle
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTouch()
    }


}
