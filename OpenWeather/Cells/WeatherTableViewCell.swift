//
//  WeatherTableViewCell.swift
//  OpenWeather
//
//  Created by gareth15 on 16/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(forecastViewViewModel: ForecastViewViewModel){
        
        if let dt = forecastViewViewModel.dt{
            let date = Date(timeIntervalSince1970: TimeInterval(dt))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.none //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.long //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            dateLabel.text = "Date: \(localDate)"
        }
        
        if let forecastMinTemp = forecastViewViewModel.temp?.min{
            let celsius = Int(forecastMinTemp - 273.15)
            minTemp.text = "Min temp: \(String(celsius))"
        }
        if let forecastMaxTemp = forecastViewViewModel.temp?.max{
            let celsius = Int(forecastMaxTemp - 273.15)
            maxTemp.text = "Max temp: \(String(celsius))"
        }
        
        if let forecastFeelsLike = forecastViewViewModel.feelsLike?.day{
            let celsius = Int(forecastFeelsLike - 273.15)
            feelsLike.text = "Feels like: \(String(celsius))"
        }
        
        if let weatherDescription = forecastViewViewModel.weather?[0].description{
            descriptionLabel.text = "Weather Description \(weatherDescription)"
        }
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
