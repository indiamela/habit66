//
//  Woop.swift
//  Habit66
//
//  Created by 楠瀬大志 on 2021/01/18.
//

import Foundation
import Firebase


struct Woop {
    var wish:String
    var outcome:[String]
    var obstacle:[String]
    var plan:String
    
    
    mutating func setFromDictionary(_ dictionary: [String:Any]){
        wish = dictionary["wish"] as? String ?? ""
        outcome = dictionary["outcome"] as? [String] ?? [""]
        obstacle = dictionary["obstacle"] as? [String] ?? [""]
        plan = dictionary["plan"] as? String ?? ""
    }
    
    var toDictionary: [String:Any]{
        return [
            "wish" : wish,
            "outcome" : outcome,
            "obstacle" : obstacle,
            "plan" : plan
        ]
    }
}

