//
//  IngredientsVO.swift
//  iOS-AlmofireExample
//
//  Created by Ye Pyae Sone Tun on 11/12/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import Foundation
import SwiftyJSON
class IngredientsVO {
    var maltArr: [MaltVO]? = nil
    var hopsArr: [HopsVO]? = nil
    var yeast: String? = nil
    
    static func parseToIngredientVO(_ data: JSON) -> IngredientsVO {
        let ingredientsVO = IngredientsVO()
        
        ingredientsVO.maltArr = data["malt"].arrayObject as? [MaltVO]
        ingredientsVO.hopsArr = data["hops"].arrayObject as? [HopsVO]
        ingredientsVO.yeast = data["yeast"].string
        
        return ingredientsVO
    }
    
}
