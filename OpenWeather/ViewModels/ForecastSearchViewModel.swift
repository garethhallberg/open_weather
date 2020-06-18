//
//  ForecastViewModel.swift
//  OpenWeather
//
//  Created by gareth15 on 16/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ForecastSearchViewModel {
    private let weatherStore: WeatherStore
    
    private let _weatherList = BehaviorRelay<[List]>(value: [])
    
    var weatherList: Driver<[List]> {
       return _weatherList.asDriver()
    }
    
    var numberOfWeathers: Int {
       return _weatherList.value.count
    }
    
    init(query: String, weatherStore: WeatherStore){
        self.weatherStore = weatherStore
        
        self.searchForecast(query: "Hull")
    }
    
    
    
    private func searchForecast(query: String?){
        guard let query = query,
            !query.isEmpty else {
            return
        }
        weatherStore.searchWeather(query: query, params: nil, successHandler: { [weak self] (response) in
            
            
            if let list = response.list{
                self?._weatherList.accept(list)
            }
        }) { error in
            print(error)
        }
    }
    
    
    public func viewModelForWeather(at index: Int) -> ForecastViewViewModel? {
        guard index < _weatherList.value.count else {
            return nil
        }
        return ForecastViewViewModel(list: _weatherList.value[index])
    }
}
