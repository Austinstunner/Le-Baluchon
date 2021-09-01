//
//  TraductionViewController.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 06/08/2021.
//

import UIKit
class TraductionViewController: UIViewController, UITextViewDelegate {
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        didReceivedNotification(notif: "french")
        didReceivedNotification(notif: "english")
        didReceivedNotification(notif: "spanish")
        didReceivedNotification(notif: "german")
        firstPic.image = #imageLiteral(resourceName: "Français")
        secondPic.image = #imageLiteral(resourceName: "Anglais")
    }
    
    // MARK: - PROPERTIES
    internal let translationManager = TranslationManager()
    internal var translatedText = String()
    
    // MARK: - @IBOUTLET
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var firstPic: UIImageView!
    @IBOutlet weak var secondPic: UIImageView!
    @IBOutlet weak var tradTextView: UITextView!
    @IBOutlet weak var resultTextView: UITextView!
    
    // MARK: - @IBACTION
    
    
    @IBAction internal func convertTraductionButton() {
        translation()
    }
    
    // MARK: - INTERFACE FUNCTION
    @IBAction internal func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        tradTextView.resignFirstResponder()
    }
    
    internal func textViewShouldReturn(_ textField: UITextField) -> Bool {
        tradTextView.resignFirstResponder()
        return true
    }
}
