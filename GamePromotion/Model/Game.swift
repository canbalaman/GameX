//
//  Game.swift
//  GamePromotion
//
//  Created by Can Balaman on 13.10.2022.
//

import Foundation

struct Games: Codable{
    let results : [Game]
}

struct Game : Codable{
    let id :Int
    let name : String
   // let backgroundImage: String
 
    
    }

enum CodingKeys: String, CodingKey {
    case id,name
   // case backgroundImage  = "background_image"
    
}


