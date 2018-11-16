//
//  MaltVO.swift
//  iOS-AlmofireExample
//
//  Created by Ye Pyae Sone Tun on 11/12/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import Foundation
import SwiftyJSON
class MaltVO {
    var name: String? = nil
    var amountValue: Double? = nil
   
    
    static func parseToMaltArray(_ data : JSON) -> MaltVO{
       let malt = MaltVO()
        malt.name = data["name"].string
        malt.amountValue = data["amount"]["value"].double
        
        return malt
    }
    
    static func parse(_ data : JSON) -> MaltVO{
        let malt = MaltVO()
        malt.name = data["name"].string
        malt.amountValue = data["amount"]["value"].double
        
        return malt
    }
    
    static func parseData(name: String, amount: Double) -> MaltVO{
        let malt = MaltVO()
        malt.name = name
        malt.amountValue = amount
        
        return malt
    }
    
    
}
