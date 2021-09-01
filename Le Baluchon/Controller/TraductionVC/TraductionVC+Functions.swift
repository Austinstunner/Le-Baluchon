//
//  TraductionVC+Functions.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 29/08/2021.
//

import UIKit
extension TraductionViewController {
    // MARK: - API CALL
    internal func getTranslation(TextToTranslate: String, source: String, target: String) {
        translationManager.getTranslation(TextToTranslate: TextToTranslate, source: source, target: target) { error, Translation in
            guard error == nil, let translation = Translation else {return}
            self.translatedText = translation.data.translations[0].translatedText
            self.resultTextView.text = self.translatedText
        }
    }
    
    // MARK: - FUNCTIONS FOR IBACTION
    
    internal func translation() {
        let french = "fr"
        let english = "en"
        let spanish = "es"
        let german = "de"
        
        if firstPic.image == #imageLiteral(resourceName: "Français") {
            getTranslation(TextToTranslate: tradTextView.text, source: french, target: english)
        }
        else if firstPic.image == #imageLiteral(resourceName: "Anglais") {
            getTranslation(TextToTranslate: tradTextView.text, source: english, target: french)
        }
        else if firstPic.image == #imageLiteral(resourceName: "Espagnol")  {
            getTranslation(TextToTranslate: tradTextView.text, source: spanish, target: english)
        }
        else {
            getTranslation(TextToTranslate: tradTextView.text, source: german, target: english)
        }
        
    }
    
    
}
