//
//  ImageCell.swift
//  PhotoGallery
//
//  Created by Tewodros Mengesha on 23/05/2019.
//  Copyright © 2019 swiftByTeddy. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let Id = "cell"
    let photoImageView: UIImageView = {
        let iv =  UIImageView(frame: CGRect.zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = false
       // iv.frame.size = CGSize(width: 50, height: 50)

        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.6392156863, blue: 0.7843137255, alpha: 1)
        
        contentView.addSubview(photoImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalTo: widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: heightAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    func configure(_ model: UIImage?) {
        photoImageView.image = model
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
