//
//  MaterialsView.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 28.04.2022.
//


import UIKit

class MaterialsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupOurMaterialsTable()
        setupMainMaterialsLabel()
        setupCollectionView()
        setupView()
    }
    
    private let ourMaterialsHeightRow: CGFloat = 44
    private let identifier: String = "cell"
    
    
    //MARK: - UIView
    private lazy var ourMaterialsTable: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        return table
    }()
    
    private lazy var mainMaterialsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Основные материалы по Swift:"
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CellCollectionView.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = UIColor(named: "bg")
        collection.layer.cornerRadius = collection.frame.width / 2
        
        return collection
    }()
    
    
    //MARK: - setups()
    
    private func setupOurMaterialsTable() {
        addSubview(ourMaterialsTable)
        ourMaterialsTable.delegate = self
        ourMaterialsTable.dataSource = self
        
        ourMaterialsTable.backgroundColor = UIColor(named: "bg")
        
        NSLayoutConstraint.activate([
            ourMaterialsTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            ourMaterialsTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            ourMaterialsTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            ourMaterialsTable.heightAnchor.constraint(equalToConstant: ourMaterialsHeightRow * CGFloat(OurMaterials.allCases.count))
        ])
    }
    
    private func setupMainMaterialsLabel(){
        addSubview(mainMaterialsLabel)
        
        NSLayoutConstraint.activate([
            mainMaterialsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainMaterialsLabel.topAnchor.constraint(equalTo: ourMaterialsTable.bottomAnchor,constant: 32),
            mainMaterialsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainMaterialsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupCollectionView(){
        addSubview(collectionView)
        
        collectionView.delegate = self // нужно как то поменять тут self
        collectionView.dataSource = self // нужно как то поменять тут self
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: mainMaterialsLabel.bottomAnchor,constant: 32),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "bg")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MaterialsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        OurMaterials.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ourMaterialsHeightRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = UITableViewCell()
        
        cell.textLabel?.text = OurMaterials.allCases[index].rowTitle
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MaterialsViewController.singltone.cellTouch()
        let collectionVC = OurLinksViewController()
        MaterialsViewController.singltone.navigationController?.pushViewController(collectionVC, animated: true)

    }
    
}

extension MaterialsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize{

        return CGSize(width: self.frame.width - 33,  height: self.frame.height / 17 )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return MaterialsViewController.singltone.mainMaterialsName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CellCollectionView
        
        cell.nameLabel.text = MaterialsViewController.singltone.mainMaterialsName[indexPath.row].name
        cell.destinationImage.image = UIImage(named: identifier)
        
        cell.layer.cornerRadius = 12.0
        cell.backgroundColor = UIColor(red: 0.788, green: 0.8, blue: 0.82, alpha: 0.24)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:5, left: 16, bottom: 10, right: 16)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)

    }
}
