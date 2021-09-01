//
//  ExchangeRateViewController.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 06/08/2021.
//

import UIKit
class ExchangeRateViewController: UIViewController, UITextFieldDelegate {
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrency()
        finalLabel.isHidden = true
        sourceRate.image = #imageLiteral(resourceName: "Euro")
        targetRate.image = #imageLiteral(resourceName: "Dollar")
        didReceivedNotification(notif: "euro")
        didReceivedNotification(notif: "usd")
        didReceivedNotification(notif: "gbp")
    }
    
    // MARK: - PROPERTIES
    internal let currencyManager = CurrencyManager()
    internal var ratesValues = [String: Double]()
    internal var base = String()
    internal var date = String()
    
    // MARK: - @IBOUTLET
    @IBOutlet weak var sourceRate: UIImageView!
    @IBOutlet weak var targetRate: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet var rateDescription: [UILabel]!
    
    // MARK: - @IBACTION
    @IBAction func whenTappedOnTextField() {
        finalLabel.isHidden = true
    }
    @IBAction func whenTappedOnConvertButton() {
        finalLabel.isHidden = false
        conversion()
    }
    
    // MARK: - INTERFACE FUNCTION
    // let users tap anywhere on the screen for remove the keyboard
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        rateTextField.resignFirstResponder()
    }
    
    // Let users tap on return's keyboard's button for remove the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        rateTextField.resignFirstResponder()
        return true
    }
    
    
}
