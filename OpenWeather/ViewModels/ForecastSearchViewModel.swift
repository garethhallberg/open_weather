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
    
    private let weatherList = BehaviorRelay<[List]>(value: [])
    
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
            print(response)
            print(response)
            
            if let list = response.list{
                self?.weatherList.accept(list)
            }
        }) { error in
            print(error)
        }
    }
}
