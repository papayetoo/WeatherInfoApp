//
//  Country.swift
//  WeatherInfo
//
//  Created by 최광현 on 2020/03/23.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

struct Country : Codable {
    let koreanName : String
    let assetName : String
    
    enum CodingKeys : String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
