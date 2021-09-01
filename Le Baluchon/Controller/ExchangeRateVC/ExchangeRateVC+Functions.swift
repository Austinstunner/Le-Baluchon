//
//  ExchangeRateVC+Functions.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 29/08/2021.
//

import UIKit
extension ExchangeRateViewController {
    // MARK: - API CALL
    internal func getCurrency() {
        currencyManager.getCurrency() { error, Currency in
            guard error == nil, let currency = Currency else {return}
            self.ratesValues = currency.rates
            self.base = currency.base
            self.date = currency.date
            self.rateDescription[0].text = "EURO : \(String(self.ratesValues["EUR"]!))"
            self.rateDescription[1].text = "USD : \(String(self.ratesValues["USD"]!))"
        }
    }
    
    // MARK: - FUNCTIONS FOR IBACTION
     internal func conversion() {
        let euro = ratesValues["EUR"]!
        let usd = ratesValues["USD"]!
        let gbp = ratesValues["GBP"]!
        let value = rateTextField.text!
        let result = Double(value)
        
        if sourceRate.image == #imageLiteral(resourceName: "Euro") {
            resultLabel.text = String((result! * usd / euro))
            finalLabel.text = "\(String(value)) € équivaut à \(round(Double(resultLabel.text!)!)) $ ! "
        } else if sourceRate.image == #imageLiteral(resourceName: "Dollar") {
            resultLabel.text = String((result! * euro / usd))
            finalLabel.text = "\(String(value)) $ équivaut à \(round(Double(resultLabel.text!)!)) € ! "
        } else {
            resultLabel.text = String((result! * usd / gbp))
            finalLabel.text = "\(String(value)) £ équivaut à \(round(Double(resultLabel.text!)!)) $ ! "
        }
    }

}


