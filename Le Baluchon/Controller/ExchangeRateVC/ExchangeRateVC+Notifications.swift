//
//  ExchangeRateVC+Notifications.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 28/08/2021.
//

import UIKit
extension ExchangeRateViewController {
    // MARK: - NOTIFICATION
    //Notifications received from SettingsVC 
   internal func didReceivedNotification(notif: String) {
        let name = Notification.Name(rawValue: notif)
        
        switch notif {
        case "euro":
            NotificationCenter.default.addObserver(self, selector: #selector(changingToEuro), name: name, object: nil)
        case "usd" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToUSD), name: name, object: nil)
        case "gbp" :
            NotificationCenter.default.addObserver(self, selector: #selector(changingToGBP), name: name, object: nil)
        default:
            break
        }
    }
    
    // MARK: - NOTIFICATION FUNCTIONS
    //Functions that will be invoke when notifications arrived
    @objc internal func changingToEuro() {
        sourceRate.image = #imageLiteral(resourceName: "Euro")
        targetRate.image = #imageLiteral(resourceName: "Dollar")
        rateDescription[0].text = "EURO : \(String(ratesValues["EUR"]!))"
        rateDescription[1].text = "USD : \(String(ratesValues["USD"]!))"
        finalLabel.isHidden = true
        resultLabel.text = ""
    }
    
    @objc internal func changingToUSD() {
        sourceRate.image = #imageLiteral(resourceName: "Dollar")
        targetRate.image = #imageLiteral(resourceName: "Euro")
        rateDescription[0].text = "USD : \(String(ratesValues["USD"]!))"
        rateDescription[1].text = "EURO : \(String(ratesValues["EUR"]!))"
        finalLabel.isHidden = true
        resultLabel.text = ""
    }
    
    @objc internal func changingToGBP() {
        sourceRate.image = #imageLiteral(resourceName: "Livre")
        targetRate.image = #imageLiteral(resourceName: "Dollar")
        rateDescription[0].text = "GBP : \(String(ratesValues["GBP"]!))"
        rateDescription[1].text = "USD : \(String(ratesValues["USD"]!))"
        finalLabel.isHidden = true
        resultLabel.text = ""
    }
}
