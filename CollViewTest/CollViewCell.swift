//
//  CollViewCell.swift
//  CollViewTest
//
//  Created by Никита Попов on 17.01.23.
//

import UIKit

class CollViewCell: UICollectionViewCell {
    var imView = UIImageView()
    //var nameLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imView)
        imView.translatesAutoresizingMaskIntoConstraints = false
        imView.contentMode = .scaleAspectFit
        imView.clipsToBounds = true
        
        imView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        imView.layer.cornerRadius = 75
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
