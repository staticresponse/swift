//
//  Drink.swift
//  Gin_Rum_Yum
//
//  Created by Mike Lewis on 4/1/20.
//  popList added on 4/19/20
//  Copyright © 2020 Mike Lewis. All rights reserved.
//

import Foundation
import UIKit

class Drink{
    var Drink_name:String = ""
    var Drink_inst:String = ""
    var Drink_primaryIng:String = ""
    var Drink_ing2:String = ""
    var Drink_ing3:String = ""
    var Drink_ing4:String = ""
    var Drink_ing5:String = ""
    var Drink_ing6:String = ""
    var Drink_ing7:String = ""
    var Drink_pic:String = ""
    var Drink_vid:String = ""
    var ing_list = [String]()
    func popList(){
        ing_list.append(Drink_primaryIng)
        ing_list.append(Drink_ing2)
        if(!Drink_ing3.isEmpty){ing_list.append(Drink_ing3)}
        if(!Drink_ing4.isEmpty){ing_list.append(Drink_ing4)}
        if(!Drink_ing5.isEmpty){ing_list.append(Drink_ing5)}
        if(!Drink_ing6.isEmpty){ing_list.append(Drink_ing6)}
        if(!Drink_ing7.isEmpty){ing_list.append(Drink_ing7)}
    }
    
}
