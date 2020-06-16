//
//  WeatherStore.swift
//  OpenWeather
//
//  Created by gareth15 on 16/06/2020.
//  Copyright © 2020 gareth15. All rights reserved.
//

import Foundation


class WeatherStore {
    public static let shared = WeatherStore()
    init() {}
    private let apiKey = K.APIKey
    private let baseAPIURL = "http://api.openweathermap.org/data/2.5"
    private let urlSession = URLSession.shared
    
    ///daily?q=Hull&cnt=GB&appid=96f2d47a11bf0aa1eb6964cd4cc3a0bc
    
    func searchWeather(query: String, params: [String : String]?, successHandler: @escaping (OpenWeatherResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        guard var urlComponents = URLComponents(string: "\(baseAPIURL)/forecast/daily") else {
            errorHandler(WeatherError.invalidEndpoint)
            return
        }
        
        var queryItems = [
                          URLQueryItem(name: "q", value: query),
                          URLQueryItem(name: "cnt", value: "14"),
                          URLQueryItem(name: "appid", value: apiKey)
                          ]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            errorHandler(WeatherError.invalidEndpoint)
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.handleError(errorHandler: errorHandler, error: WeatherError.apiError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.handleError(errorHandler: errorHandler, error: WeatherError.invalidResponse)
                return
            }
            
            guard let data = data else {
                self.handleError(errorHandler: errorHandler, error: WeatherError.noData)
                return
            }

            do {
                let openWeatherResponse = try JSONDecoder().decode(OpenWeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    successHandler(openWeatherResponse)
                }
            } catch {
                self.handleError(errorHandler: errorHandler, error: WeatherError.serializationError)
            }
            }.resume()
        
    }
    
    private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
        DispatchQueue.main.async {
            errorHandler(error)
        }
    }
    
}


public enum WeatherError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}
