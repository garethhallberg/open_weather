//
//  ViewController.swift
//  OpenWeather
//
//  Created by gareth15 on 16/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    var forecastSearchViewModel: ForecastSearchViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        forecastSearchViewModel = ForecastSearchViewModel(query: "Hull", weatherStore: WeatherStore.shared)
        
        forecastSearchViewModel
            .weatherList
            .drive(onNext:{ [unowned self] (_) in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
     setupTableView()
    }

    private func setupTableView(){
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
    }
    
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastSearchViewModel.numberOfWeathers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        if let viewModel = forecastSearchViewModel.viewModelForWeather(at: indexPath.row) {
            cell.configure(forecastViewViewModel: viewModel)
        }
        return cell
    }
        
}




