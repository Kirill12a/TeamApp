//
//  CustomCell.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 24.04.2022.
//

import SnapKit
import UIKit

class CustomCell: UITableViewCell {

    lazy var label: UILabel = {
        var label = UILabel()
        label.text = "fd"
        return label
    }()

    lazy var testImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "sf")
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        contentView.addSubview(label)
        contentView.addSubview(testImage)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
      super.layoutSubviews()
//      label.frame = CGRect(x: 10, y: 5, width: contentView.bounds.size.width - 20, height: contentView.bounds.size.height - 10)

        label.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.center.equalToSuperview()
        }

        testImage.snp.makeConstraints { make in
            make.height.width.equalTo(14)
            make.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(14)
//            make.leading.equalTo(label.sn).inset(60)
        }
    }


}
