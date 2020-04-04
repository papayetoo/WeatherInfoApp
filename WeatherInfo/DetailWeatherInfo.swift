//
//  DetailWeatherInfo.swift
//  WeatherInfo
//
//  Created by 최광현 on 2020/03/25.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation


struct DetailWeatherInfo : Codable{

    
    var cityName : String
    var state : Int
    var celsius : Double
    var rainfallProbability : Int
    
    /* enum CodingKeys 라고 명명하지 않으면 제대로 실행되지 않음.
    이는 Codable의 protocol을 따르기 위함.
     */
    enum CodingKeys : String, CodingKey{
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
    }
}
