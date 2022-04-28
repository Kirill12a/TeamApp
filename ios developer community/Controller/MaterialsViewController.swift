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


    // Это данные для collectionView
    // хз тут это нужно делать или нет.
    let mainMaterialsName = [MainMaterialModel(name: "Apple Doka"), MainMaterialModel(name: "Swift Book")]

    override func loadView() {
        super.loadView()
        view = MaterialsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bg")
        setupNavController()
    }

    // тут я хотел делать переход на второй экран(из фигмы), но не воркает
    @objc func cellTouch(){

        let collectionVC = LinksViewController()
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
