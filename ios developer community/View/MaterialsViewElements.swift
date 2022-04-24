//
//  MaterialsViewElements.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 24.04.2022.
//

import UIKit
import SnapKit

class MaterialsViewElements: UIView {

    lazy var table: UITableView = {
        var tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.headerView
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
        table.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaInsets.top)
            make.leading.trailing.equalToSuperview() // ??
            make.top.equalToSuperview()
        }
    }



}
