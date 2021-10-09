//
//  SecondViewController.swift
//  Exercise2
//
//  Created by Anhnguyen on 09/10/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var randomImageBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var imageArr: [UIImage] = [UIImage(named: "image1")!,
                               UIImage(named: "image2")!,
                               UIImage(named: "image3")!,
                               UIImage(named: "image4")!,
                               UIImage(named: "image5")!]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArr[0]
    }
    
    @IBAction func randomImageAction(_ sender: UIButton) {
        let currentImg = imageView.image
        let imgFilter = imageArr.filter { img in
            return img != currentImg
        }
        imageView.image = imgFilter.randomElement()
    }
}
