//
//  CellCollectionView.swift
//  ios developer community
//
//  Created by Kirill Drozdov on 28.04.2022.
//

import Foundation
import UIKit


class CellCollectionView: UICollectionViewCell {
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        label.textColor = UIColor(red: 113/255, green: 116/255, blue: 122/255, alpha: 1)
        return label
    }()
    
    lazy var destinationImage: UIImageView = {
        var destImage = UIImageView()
        destImage.translatesAutoresizingMaskIntoConstraints = false
        destImage.contentMode = .scaleAspectFit
        destImage.clipsToBounds = true
        return destImage
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: contentView.bounds.height / 2),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -(contentView.bounds.width / 2.6)), // 2.4 было
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        contentView.addSubview(destinationImage)
        NSLayoutConstraint.activate([
            destinationImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            destinationImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12 ),
            destinationImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -12),
            destinationImage.widthAnchor.constraint(equalToConstant: 16),
            destinationImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


