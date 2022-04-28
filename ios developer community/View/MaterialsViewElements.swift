//
//  MaterialsViewElements.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 24.04.2022.
//

import UIKit
import SnapKit

class Header:  UITableViewHeaderFooterView {

    lazy var headerLabel: UILabel = {
        var label = UILabel()

        label.text = "TEst"

        return label
    }()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        headerLabel.snp.makeConstraints { make in
//            make.height.equalTo(40)
//
//        }
    }
    

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

class MaterialsViewElements: UIView {

    lazy var table: UITableView = {
        var tableView = UITableView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.layer.borderWidth = 3
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.layer.cornerRadius = 20
        

        
        return tableView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        settingsTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func settingsTableView(){
        self.addSubview(table)
//        table.snp.makeConstraints { make in
////            make.top.equalTo(self.safeAreaInsets.top)
//////            make.top.equalToSuperview()
////            make.leading.trailing.equalToSuperview() // ??
////            make.top.equalToSuperview()
//
//            make.width.equalTo(350)
//            make.height.equalTo(130)
//            make.center.equalToSuperview()
//        }
    }



}
