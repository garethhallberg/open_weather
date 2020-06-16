import Foundation

// MARK: - OpenWeather
struct OpenWeatherResponse: Codable {
    let city: City?
    let cod: String?
    let message: Double?
    let cnt: Int?
    let list: [List]?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - List
struct List: Codable {
    let dt, sunrise, sunset: Int?
    let temp: Temp?
    let feels_like: FeelsLike?
    let pressure, humidity: Int?
    let weather: [Weather]?
    let speed: Double?
    let deg, clouds: Int?
    let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feels_like
        case pressure, humidity, weather, speed, deg, clouds, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: Main?
    let description: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case description
        case icon
    }
}



enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}




