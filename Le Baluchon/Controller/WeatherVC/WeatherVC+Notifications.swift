//
//  WeatherVC+Notifications.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 29/08/2021.
//

import UIKit
extension WeatherViewController {
    // MARK: - NOTIFICATIONS
    func didReceivedNotification(notif: String) {
        let name = Notification.Name(rawValue: notif)
        
        switch notif {
        case "celsius" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToCelsius), name: name, object: nil)
        case "farhanaiet" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToFarhanaiet), name: name, object: nil)
        case "adress" :
            NotificationCenter.default.addObserver(self, selector: #selector(addAdress), name: name, object: nil)
            
        default:
            break
        }
    }
    
    // MARK: - NOTIFICATION FUNCTIONS
    @objc  func changingToCelsius() {
        units = "metric"
    }
    
    @objc  func changingToFarhanaiet() {
        units = "imperial"
        firstFrameTitle.isHidden = false
        firstFrameIcon.isHidden = false
        firstFrameTemp.isHidden = false
        firstFrameDescription.isHidden = false
        firstFrameInstruction.isHidden = true
    }
    
    @objc  func addAdress(notification: Notification) {
         let te = notification.userInfo?["localization"] as? String 
        getWeather(chooseCity: te!, units: units, name: te!)
             firstFrameTitle.isHidden = false
             firstFrameIcon.isHidden = false
             firstFrameTemp.isHidden = false
             firstFrameDescription.isHidden = false
             firstFrameInstruction.isHidden = true
            
        
        
      
    }
    
}

