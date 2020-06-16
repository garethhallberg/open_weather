//
//  ViewController.swift
//  OpenWeather
//
//  Created by gareth15 on 16/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let weatherStore = WeatherStore()
        weatherStore.searchWeather(query: "Hull", params: nil, successHandler: { [weak self] (response) in
            print(response)
            print(response)
        }) { [weak self] (error) in
            print(error)
        }
    }


}

