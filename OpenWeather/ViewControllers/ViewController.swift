//
//  ViewController.swift
//  OpenWeather
//
//  Created by gareth15 on 16/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var forecastViewModel: ForecastSearchViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        forecastViewModel = ForecastSearchViewModel(query: "Hull", weatherStore: WeatherStore.shared)
        
//        movieSearchViewViewModel = MovieSearchViewViewModel(query: searchBar.rx.text.orEmpty.asDriver(), movieService: MovieStore.shared)
    }


}

