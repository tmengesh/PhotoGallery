//
//  ShowAllViewController.swift
//  PhotoGallery
//
//  Created by Tewodros Mengesha on 23/05/2019.
//  Copyright © 2019 swiftByTeddy. All rights reserved.
//

import UIKit

class ShowAllViewController: UIViewController {
    
    //let array:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    // MARK: - UI
    lazy var gridCollectionView: UICollectionView = {
        let cV = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: GridLayout())
        cV.backgroundColor = UIColor.black
        cV.showsVerticalScrollIndicator = false
        cV.showsHorizontalScrollIndicator = false
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.dataSource = self as? UICollectionViewDataSource
        cV.delegate = self as? UICollectionViewDelegate
        cV.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.Id)
        return cV
    }()
    
    lazy var fullImageView: UIImageView = {
        let iV = UIImageView()
        iV.contentMode = .scaleAspectFit
        iV.backgroundColor = UIColor.lightGray
        iV.isUserInteractionEnabled = true
        iV.alpha = 0
        iV.contentMode = .scaleAspectFit
        iV.translatesAutoresizingMaskIntoConstraints = false
        let dismissWihtTap = UITapGestureRecognizer(target: self, action: #selector(hideFullImage))
        iV.addGestureRecognizer(dismissWihtTap)
        return iV
    }()
    
    //Close button
    let image = UIImage(named: "closeIcon") as UIImage?
    let closeButton = UIButton()
 
    
    // MARK: - App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(gridCollectionView)
        self.view.addSubview(fullImageView)
        
        closeButton.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 50, height: 50)
        closeButton.backgroundColor = UIColor.clear
        closeButton.setImage(image, for: .normal)
        closeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(closeButton)
    }
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        if((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
            print("done")
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            gridCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gridCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gridCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor),
            fullImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    // MARK:- Animation
    func showFullImage(of image: UIImage) {
        
        fullImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
            self.fullImageView.image = image
            self.fullImageView.alpha = 1
            self.fullImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        closeButton.isHidden = true
        
    }
    
    @objc func hideFullImage() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
            self.fullImageView.alpha = 0
        }, completion: nil)
        closeButton.isHidden = false
    }
    
}

extension ShowAllViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
        //When collectionViews are populated with image array.
        //return array.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.Id, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        cell.configure(UIImage.init(named: "zizou"))
        //A way to assign images from image array
        //cell.configure(UIImage(named: array[indexPath.row] + ".jpeg"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCell,
            let image = cell.photoImageView.image else { return }
        self.showFullImage(of: image)
        
    }
}








