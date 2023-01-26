//
//  WeatherResponse.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/26.
//

struct WeatherResponse: Decodable {
    var coord: coord
    var weather: [weather]
    var base : String
    var main : main
    var visibility : Int
    var wind : wind
    var snow : snow
    var clouds : clouds
    var dt : Int
    var sys : sys
    var timezone : Int
    var id : Int
    var name : String
    var cod : Int
    
    
    
}

struct coord: Codable {
    var lon: Float
    var lat: Float
}

struct weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct main: Codable {
    var temp : Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var humidity: Float
}

struct wind: Codable {
    var speed: Float
    var deg: Int
}

struct snow: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}
struct clouds: Decodable {
    var all: Int
}

struct sys: Decodable {
    
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

