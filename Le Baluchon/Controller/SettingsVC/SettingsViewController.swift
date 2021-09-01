//
//  SettingsViewController.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 06/08/2021.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - NOTIFICATION CENTER
    func notificationStep(withNotificationCalled: String) {
        let name = Notification.Name(rawValue: withNotificationCalled)
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
        
    }
    
    
    // MARK: - @IBOUTLET
    //Background Part
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var views: [UIView]!
    
    //Devise Part
    @IBOutlet var checkRate: [UIButton]!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    
    //Language Part
    @IBOutlet weak var langueView: UIView!
    @IBOutlet weak var langueLabel: UILabel!
    @IBOutlet var checkLanguage: [UIButton]!
    
    //location Part
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    
    
    //Temperature Part
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var farhainaietLabel: UILabel!
    @IBOutlet var checkTemperature: [UIButton]!
    
    //Theme Part
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var whiteLabel: UILabel!
    @IBOutlet weak var blackLabel: UILabel!
    @IBOutlet var checkColor: [UIButton]!
    
    //Update Part
    @IBOutlet weak var updateView: UIView!
    @IBOutlet weak var updateRateText: UIButton!
    @IBOutlet weak var updateLogo: UIImageView!
    
    // MARK: - @IBACTIONS
    
    @IBAction func pushThemeButtons(_ sender: UIButton) {
        
        let tag = sender.tag
        
        switch tag {
        case 9:
            notificationStep(withNotificationCalled: "white")
            chooseTheColorTo(.white)
            
        case 10:
            notificationStep(withNotificationCalled: "black")
            chooseTheColorTo(.black)
            
        default:
            break
        }
        
        
    }
    
    @IBAction func selectRates(_ sender: UIButton) {
        let tag = sender.tag
        
        switch tag {
        case 1:
            notificationStep(withNotificationCalled: "euro")
            checkRate[0].setImage(UIImage(named: "Check"), for: .normal)
            checkRate[1].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkRate[2].setImage(UIImage(named: "Uncheck"), for: .normal)
            
        case 2:
            notificationStep(withNotificationCalled: "usd")
            checkRate[0].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkRate[1].setImage(UIImage(named: "Check"), for: .normal)
            checkRate[2].setImage(UIImage(named: "Uncheck"), for: .normal)
        case 3:
            notificationStep(withNotificationCalled: "gbp")
            checkRate[0].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkRate[1].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkRate[2].setImage(UIImage(named: "Check"), for: .normal)
        default:
            break
        }
    }
    
    @IBAction func selectLanguage(_ sender: UIButton) {
        let tag = sender.tag
        
        switch tag {
        case 4:
            notificationStep(withNotificationCalled: "french")
            
            checkLanguage[0].setImage(UIImage(named: "Check"), for: .normal)
            checkLanguage[1].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[2].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[3].setImage(UIImage(named: "Uncheck"), for: .normal)
        case 5:
            notificationStep(withNotificationCalled: "english")
            checkLanguage[0].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[1].setImage(UIImage(named: "Check"), for: .normal)
            checkLanguage[2].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[3].setImage(UIImage(named: "Uncheck"), for: .normal)
        case 6:
            notificationStep(withNotificationCalled: "spanish")
            checkLanguage[0].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[1].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[2].setImage(UIImage(named: "Check"), for: .normal)
            checkLanguage[3].setImage(UIImage(named: "Uncheck"), for: .normal)
        case 13:
            notificationStep(withNotificationCalled: "german")
            checkLanguage[0].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[1].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[2].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkLanguage[3].setImage(UIImage(named: "Check"), for: .normal)
        default:
            break
        }
    }
    @IBAction func whenEditing(_ sender: UITextField) {
        let tag = sender.tag
        
        switch tag {
        case 21:
            let text = locationTextField.text
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "adress"), object: text, userInfo: ["localization" : text!])
        default:
            break
        }
    }
    
    @IBAction func selectTemperatureScale(_ sender: UIButton) {
        let tag = sender.tag
        
        switch tag {
        case 7:
            notificationStep(withNotificationCalled: "celsius")
            checkTemperature[0].setImage(UIImage(named: "Check"), for: .normal)
            checkTemperature[1].setImage(UIImage(named: "Uncheck"), for: .normal)
        case 8:
            notificationStep(withNotificationCalled: "farhanaiet")
            checkTemperature[0].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkTemperature[1].setImage(UIImage(named: "Check"), for: .normal)
        default:
            break
        }
    }
    
    // MARK: - COLOR OF APP
    enum Color {
        case white, black
    }
    
    private func chooseTheColorTo(_ color: Color) {
        
        switch color {
        case .white:
            background.image = #imageLiteral(resourceName: "Background color")
            checkColor[0].setImage(UIImage(named: "Check"), for: .normal)
            checkColor[1].setImage(UIImage(named: "Uncheck"), for: .normal)
            updateRateText.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            updateLogo.image = #imageLiteral(resourceName: "Update reglages black")
            
            for UILabel in labels {
                UILabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
            
            for UIView in views {
                UIView.backgroundColor = #colorLiteral(red: 0.9323555827, green: 0.9374837279, blue: 0.9329114556, alpha: 1)
            }
            
        case .black:
            background.image = #imageLiteral(resourceName: "Background")
            checkColor[0].setImage(UIImage(named: "Uncheck"), for: .normal)
            checkColor[1].setImage(UIImage(named: "Check"), for: .normal)
            updateRateText.setTitleColor(#colorLiteral(red: 0.9323555827, green: 0.9374837279, blue: 0.9329114556, alpha: 1), for: .normal)
            
            updateLogo.image = #imageLiteral(resourceName: "Update reglages")
            for UILabel in labels {
                UILabel.textColor = #colorLiteral(red: 0.9371625781, green: 0.9373195171, blue: 0.9371418357, alpha: 1)
            }
            for UIView in views {
                UIView.backgroundColor = #colorLiteral(red: 0.5332786441, green: 0.5333716869, blue: 0.5332663655, alpha: 1)
            }
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        locationTextField.resignFirstResponder()
        return true
    }
    
    
    //---------------END OF THE CLASS------------------
    
    
    
    
}
