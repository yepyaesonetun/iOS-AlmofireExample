//
//  ImageFullScreenViewController.swift
//  iOS-AlmofireExample
//
//  Created by Ye Pyae Sone Tun on 11/13/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit

class ImageFullScreenViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var ivBeerImage: UIImageView!
    @IBOutlet weak var ivClose: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var image: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.scrollView.maximumZoomScale = 2.0
//        self.scrollView.delegate = self
//        self.scrollView.addSubview(ivBeerImage)

        ivBeerImage.sd_setImage(with: URL(string:image  ?? "beer_filled_placeholder"), placeholderImage: UIImage(named: "beer_filled_placeholder"))
        
        let onTap = UITapGestureRecognizer(target: self, action: #selector(onClickClose))
        ivClose.isUserInteractionEnabled = true
        ivClose.addGestureRecognizer(onTap)
    }
    
    @objc func onClickClose(){
        self.dismiss(animated: true, completion: nil)
    }
  
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return ivBeerImage
        
    }
  
}
