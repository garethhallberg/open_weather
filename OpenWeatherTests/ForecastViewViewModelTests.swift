//
//  ForecastViewViewModelTests.swift
//  OpenWeatherTests
//
//  Created by gareth15 on 18/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import XCTest
@testable import OpenWeather

class ForecastViewViewModelTests: XCTestCase {
    
    private var weatherList: List? = nil

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let dt = 1592481600
        let sunrise = 1592451007
        let sunset = 1592512500
        
        
        let day = 287.48
        let min = 285.83
        let max = 288.08
        let night = 285.83
        let eve =  288.08
        let morn = 287.48
        
        let temp = Temp(day: day, min: min, max: max, night: night, eve: eve, morn: morn)
        
        let feelsLikeDay = 285.1
        let feelsLikeNight = 284.94
        let feelsLikeEve = 287.42
        let feelsLikeMorn = 285.51
        
        let feelsLike = FeelsLike(day: feelsLikeDay, night: feelsLikeNight, eve: feelsLikeEve, morn: feelsLikeMorn)
        
        let pressure = 1009
        let humidity = 100
        
        let id = 500
        let main = "Rain"
        let description = "light rain"
        let icon = "10d"
        
        let weatherStruct = Weather(id: id, main: Main(rawValue: main), description: description, icon: icon)
        let weather = [weatherStruct]
        
        let speed = 4.78
        let deg = 38
        let clouds = 100
        let rain = 1.73
        
        
        weatherList = List(dt: dt, sunrise: sunrise,
                        sunset: sunset, temp: temp,
                        feels_like: feelsLike, pressure: pressure,
                        humidity: humidity, weather: weather,
                        speed: speed, deg: deg,
                        clouds: clouds, rain: rain)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDt() {
        
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let dt = forecastViewViewModel.dt
        
        XCTAssert(dt == 1592481600, "dt value read correctly")
    }
    
    func testSunrise() {
        
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let sunrise = forecastViewViewModel.sunrise
        
        XCTAssert(sunrise == 1592451007, "sunrise value read correctly")
    }
    
    func testSunset() {
        
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let sunset = forecastViewViewModel.sunset
        
        XCTAssert(sunset == 1592512500, "sunset value read correctly")
    }
    
    func testTempDay() {
        
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let temp = forecastViewViewModel.temp
        
        let day = temp?.day
        
        XCTAssert(day == 287.48, "temp.day value read correctly")
    }
    
    func testTempMin() {
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let temp = forecastViewViewModel.temp
        
        let min = temp?.min
        
        XCTAssert(min == 285.83, "temp.min value read correctly")
    }
    
    func testTempMax() {
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let temp = forecastViewViewModel.temp
        
        let max = temp?.max
        
        XCTAssert(max == 288.08, "temp.max value read correctly")
    }
    
    func testTempNight() {
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let temp = forecastViewViewModel.temp
        
        let night = temp?.night
        
        XCTAssert(night == 285.83, "temp.night value read correctly")
    }
    
    func testTempEve() {
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let temp = forecastViewViewModel.temp
        
        let eve = temp?.eve
        
        XCTAssert(eve == 288.08, "temp.eve value read correctly")
    }
    
    func testTempMorn() {
        let forecastViewViewModel = ForecastViewViewModel(list: weatherList!)
        let temp = forecastViewViewModel.temp
        
        let morn = temp?.morn
        
        XCTAssert(morn == 287.48, "temp.morn value read correctly")
    }
    
    
    

    

}
