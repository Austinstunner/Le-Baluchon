//
//  TraductionVC+Notifications.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 29/08/2021.
//

import UIKit
extension TraductionViewController {
    // MARK: - ENUMERATION
    internal enum Pictures {
        case french, english, spanish, german
        
        func getPictures() -> UIImage {
            var pic: UIImage
            
            switch self {
            case .french:
                pic = #imageLiteral(resourceName: "Français")
            case .english:
                pic = #imageLiteral(resourceName: "Anglais")
            case .spanish:
                pic = #imageLiteral(resourceName: "Espagnol")
            case .german:
                pic = #imageLiteral(resourceName: "Allemand")
            }
            return pic
        }
    }
    
    // MARK: - NOTIFICATIONS
    internal func didReceivedNotification(notif: String) {
        let name = Notification.Name(rawValue: notif)
        
        switch notif {
        case "french" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToFrench), name: name, object: nil)
        case "english" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToEnglish), name: name, object: nil)
        case "spanish" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToSpanish), name: name, object: nil)
        case "german" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToGerman), name: name, object: nil)
        default:
            break
        }
    }
    
    // MARK: - NOTIFICATION FUNCTIONS
    @objc internal func changingToFrench() {
        firstPic.image =  Pictures.getPictures(.french)()
        secondPic.image = Pictures.getPictures(.english)()
        resultTextView.text = ""
    }
    
    @objc internal func changingToEnglish() {
        firstPic.image =  Pictures.getPictures(.english)()
        secondPic.image = Pictures.getPictures(.french)()
        resultTextView.text = ""
        
    }
    
    @objc internal func changingToSpanish() {
        firstPic.image =  Pictures.getPictures(.spanish)()
        secondPic.image = Pictures.getPictures(.english)()
        resultTextView.text = ""
    }
    @objc internal func changingToGerman() {
        firstPic.image =  Pictures.getPictures(.german)()
        secondPic.image = Pictures.getPictures(.english)()
        resultTextView.text = ""
    }
    
}
