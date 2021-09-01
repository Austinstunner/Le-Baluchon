//
//  WeatherViewController.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 06/08/2021.
//

import UIKit
class WeatherViewController: UIViewController {
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        didReceivedNotification(notif: "celsius")
        didReceivedNotification(notif: "farhanaiet")
        //didReceivedNotification(notif: "adress")
    }
    // MARK: - VIEWDIDAPPEAR
   
    override func viewDidAppear(_ animated: Bool) {
        getWeatherOfNY(chooseCity: 5128581, units: units)
        secondFrameTemp.text = "\(String(round(tempOfNY)))°C"
        didReceivedNotification(notif: "adress")
    }
    var units = "metric"
    // MARK: - PROPERTIES
    internal let weatherManager = WeatherManager()
    internal let weatherManager2 = SecondWeatherManager()
    //variable for NY
    internal var descriptionOfNY = String()
    internal var iconOfNY = String()
    internal var tempOfNY = Double()
    //variable for other
    internal var descriptions = String()
    internal var icon = String()
    internal var temp = Double()
    internal var text = String()
    
    
    // MARK: - @IBOUTLET
    
    @IBOutlet weak var firstFrameTitle: UILabel!
    @IBOutlet weak var firstFrameIcon: UIImageView!
    @IBOutlet weak var firstFrameTemp: UILabel!
    @IBOutlet weak var firstFrameDescription: UILabel!
    @IBOutlet weak var firstFrameInstruction: UILabel!
    
    @IBOutlet weak var secondFrameTitle: UILabel!
    @IBOutlet weak var secondFrameIcon: UIImageView!
    @IBOutlet weak var secondFrameTemp: UILabel!
    @IBOutlet weak var secondFrameDescription: UILabel!
    
}
