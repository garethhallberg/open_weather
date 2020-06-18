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

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
