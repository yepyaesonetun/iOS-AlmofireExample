//
//  ViewController.swift
//  iOS-AlmofireExample
//
//  Created by Ye Pyae Sone Tun on 11/12/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import ProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var beerCollectionView: UICollectionView!
    var beerList: [BeerVO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beerCollectionView.dataSource = self
        self.beerCollectionView.delegate = self
        
        CellRegisterUtil.cellRegister(nibName: "BeerCollectionViewCell", collectionView: beerCollectionView)
        
        loadBeers()
    }

    func loadBeers()  {
        
        ProgressHUD.show("Fetching Data")
        
        Alamofire.request("https://api.punkapi.com/v2/beers",method:.get).responseJSON{
            (response)  in
            switch response.result{
            case .success:
                ProgressHUD.dismiss()
                
                let api = response.result.value
                
                let json = JSON(api!)
                let data  = json.array
                if let result = data {
                    var beerList : [BeerVO] = []
                    
                    result.forEach({(beer) in
                        beerList.append(BeerVO.parseToBeerVO(beer))
                    })
                    
                    self.beerList = beerList
                    self.beerCollectionView.reloadData()
                    
                }
                
            case .failure:
                ProgressHUD.dismiss()
                print("call fail")
                ProgressHUD.showError("Network Failure", interaction: false)
            }
        }
    }

}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let beer = self.beerList[indexPath.item]
        
        let beerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as! BeerCollectionViewCell
        beerCollectionViewCell.lblBeerName.text = beer.name
        beerCollectionViewCell.ivBeerImage.sd_setImage(with: URL(string:beer.image ?? "beer_filled_placeholder"), placeholderImage:UIImage(named:"beer_placeholder"))
        
        return beerCollectionViewCell
    }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat =  12
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      
//        print("\(String(describing: self.beerList[indexPath.item].ingredients!.yeast))")
        
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailViewController
        vc.beerVO = self.beerList[indexPath.item]
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

