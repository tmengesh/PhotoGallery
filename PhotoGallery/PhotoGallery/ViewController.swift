//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Tewodros Mengesha on 23/05/2019.
//  Copyright © 2019 swiftByTeddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnShowPhotos(_ sender: Any) {
        let showPhotoVC = ShowAllViewController()
        self.present(showPhotoVC, animated: true, completion: nil)
    }
    
}

