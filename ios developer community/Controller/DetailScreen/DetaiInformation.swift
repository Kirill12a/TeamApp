//
//  DetaiInformation.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 04.05.2022.
//

import UIKit

class DetaiInformation: UIViewController {

    let mainMaterialsName = [MainMaterialModel(name: "Apple Doka"), MainMaterialModel(name: "Swift Book")]


    var myCollectionView:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello"
        view.backgroundColor = .purple

        navigationController?.navigationBar.prefersLargeTitles = true

        let view = UIView()
        view.backgroundColor = .white

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)

        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = UIColor.white

        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self

        view.addSubview(myCollectionView ?? UICollectionView())

        self.view = view

    }
}




extension DetaiInformation: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMaterialsName.count // How many cells to display
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) 
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
}
extension DetaiInformation: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}
