//
//  DetailViewController.swift
//  iOS-AlmofireExample
//
//  Created by Ye Pyae Sone Tun on 11/12/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var ivBeer: UIImageView!
    @IBOutlet weak var lblBeerName: UILabel!
    @IBOutlet weak var lblTagLine: UILabel!
    @IBOutlet weak var lblAlcholByVolumeValue: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblBrewersTips: UILabel!
    @IBOutlet weak var ivImageFullScreen: UIImageView!
    @IBOutlet weak var lblFoodParing: UILabel!
    @IBOutlet weak var lblIngredientsYeast: UILabel!
    
    var beerVO: BeerVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindBeerVO(beerVO!)
        
        let onTap = UITapGestureRecognizer(target: self, action: #selector(onClickFullScreenImage))
        ivImageFullScreen.isUserInteractionEnabled = true
        ivImageFullScreen.addGestureRecognizer(onTap)
    }
    
    @objc func onClickFullScreenImage() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ImageFullScreenViewController") as! ImageFullScreenViewController
        print("\(String(describing: beerVO?.image))")
        let  imge = beerVO?.image
        vc.image = imge
        self.present(vc, animated: true, completion: nil)
    }
    
    func bindBeerVO(_ beerVO: BeerVO) {
        lblBeerName.text = beerVO.name
        lblTagLine.text = beerVO.tagLine
        lblBrewersTips.text = "\" \(beerVO.brewersTips!) \""
        lblAlcholByVolumeValue.text = String(beerVO.abv!)
        lblDescription.text = beerVO.description
        ivBeer.sd_setImage(with: URL(string:beerVO.image ?? "beer_filled_placeholder"), placeholderImage: UIImage(named: "beer_filled_placeholder"))
        lblFoodParing.text = beerVO.foodParing!.joined(separator: "\n")
        lblIngredientsYeast.text = beerVO.ingredients?.yeast
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
