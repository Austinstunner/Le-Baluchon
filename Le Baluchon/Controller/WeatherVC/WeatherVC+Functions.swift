//
//  WeatherVC+Functions.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 29/08/2021.
//

import UIKit
extension WeatherViewController {
    // MARK: - API CALL
    internal func getWeather(chooseCity: String, units: String, name: String) {
        
        weatherManager2.getWeather(chooseCity: chooseCity, units: units, name: name) { error, Weather in
            guard error == nil, let weather = Weather else {return}
            self.descriptions = weather.weather[0].description
            self.icon = weather.weather[0].icon
            self.temp = weather.main.temp
            self.firstFrameDescription.text = self.descriptions
            self.firstFrameTitle.text = "Météo de \(name)"
            self.firstFrameIcon.image = self.getIcons(icon: self.icon)
            if units == "metric" {
                self.firstFrameTemp.text = "\(String(round(self.temp)))°C"
            } else {
                self.firstFrameTemp.text = "\(String(round(self.temp)))°F"
            }
            
        }
    }
    
    internal func getWeatherOfNY(chooseCity: Int, units: String) {
        
        weatherManager.getWeatherOfNY(chooseCity: chooseCity, units: units) { error, Weather in
            guard error == nil, let weather = Weather else {return}
            self.descriptionOfNY = weather.weather[0].description
            self.iconOfNY = weather.weather[0].icon
            self.tempOfNY = weather.main.temp
            self.secondFrameDescription.text = self.descriptionOfNY
            self.secondFrameTitle.text = "Météo de New York"
            self.secondFrameIcon.image = self.getIcons(icon: self.iconOfNY)
            if units == "metric" {
                self.secondFrameTemp.text = "\(String(round(self.tempOfNY)))°C"
            } else {
                self.secondFrameTemp.text = "\(String(round(self.tempOfNY)))°F"
            }
        }
    }
    
    // MARK: - API FUNCTION
    func getIcons(icon: String) -> UIImage {
        var icons: UIImage
        switch icon {
        case "01d":
            icons = UIImage(named: "01d")!
        case "02d":
            icons = UIImage(named: "02d")!
        case "03d":
            icons = UIImage(named: "03d")!
        case "04d":
            icons = UIImage(named: "04d")!
        case "09d":
            icons = UIImage(named: "09d")!
        case "10d":
            icons = UIImage(named: "10d")!
        case "11d":
            icons = UIImage(named: "11d")!
        case "13d":
            icons = UIImage(named: "13d")!
        case "50d":
            icons = UIImage(named: "50d")!
        case "01n":
            icons = UIImage(named: "01n")!
        case "02n":
            icons = UIImage(named: "02n")!
        case "03n":
            icons = UIImage(named: "03n")!
        case "04n":
            icons = UIImage(named: "04n")!
        case "09n":
            icons = UIImage(named: "09n")!
        case "10n":
            icons = UIImage(named: "10n")!
        case "11n":
            icons = UIImage(named: "11n")!
        case "13n":
            icons = UIImage(named: "13n")!
        case "50n":
            icons = UIImage(named: "50n")!
            
        default:
            icons = UIImage(named: "50n")!
        }
        return icons
    }
    
}
