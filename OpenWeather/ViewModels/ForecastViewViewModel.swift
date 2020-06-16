//
//  ForecastViewViewModel.swift
//  OpenWeather
//
//  Created by gareth15 on 16/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import Foundation

struct ForecastViewViewModel {
    
    private var list: List
    
    init(list: List) {
        self.list = list
    }
    
    
    var dt: Int? {
        return list.dt
    }
    
    var sunrise: Int? {
        return list.sunrise
    }
    
    var sunset: Int? {
        return list.sunset
    }
    
    var temp: Temp? {
        return list.temp
    }
    
    var feelsLike: FeelsLike? {
        return list.feels_like
    }
    
    var pressure: Int? {
        return list.pressure
    }
    
    var humidity: Int? {
        return list.humidity
    }
    
    var weather: [Weather]? {
        return list.weather
    }
    
    var speed: Double? {
        return list.speed
    }
    
    var deg: Int? {
        return list.deg
    }
    
    var clouds: Int? {
        return list.clouds
    }
    
    var rain: Double? {
        return list.rain
    }
    
    
}
