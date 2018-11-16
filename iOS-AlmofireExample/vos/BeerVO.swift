//
//  BeerVO.swift
//  iOS-AlmofireExample
//
//  Created by Ye Pyae Sone Tun on 11/12/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import Foundation
import SwiftyJSON
class BeerVO {
    var id: Int? = nil
    var name: String? = nil
    var tagLine: String? = nil
    var firstBrewed: String? = nil
    var description: String? = nil
    var image: String? = nil
    var abv: Double? = nil
    var ingredients: IngredientsVO?  = nil
    var brewersTips: String? = nil
    var foodParing: [String]? = nil
    
    static func parseToBeerVO(_ data : JSON ) -> BeerVO {
        
        let beer = BeerVO()
        beer.id = data["id"].int
        beer.name = data["name"].string
        beer.tagLine = data["tagline"].string
        beer.firstBrewed = data["first_brewed"].string
        beer.description = data["description"].string
        beer.image = data["image_url"].string
        beer.abv = data["abv"].double
//        beer.ingredients = data["ingredients"].object as? IngredientsVO
        beer.brewersTips = data["brewers_tips"].string
        beer.foodParing = data["food_pairing"].arrayObject as? [String]
        beer.ingredients = IngredientsVO.parseToIngredientVO(data["ingredients"])

        return beer
    }
}
