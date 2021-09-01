//
//  CurrencyConversion.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 09/08/2021.
//

import Foundation

class CurrencyManager {
    
    private var session: URLSession
    private var taskSession: URLSessionDataTask?
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func getCurrency(callBack: @escaping (Error?, Currency?) -> Void) {
        guard let url = URL(string: URLApiList.getUrl(.fixerApi)())
        else { return }
        
        taskSession?.cancel()
        
        taskSession = session.dataTask(with: url) { (data, response,
                                                     error) in
            DispatchQueue.main.async {
                guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callBack(error, nil)
                    
                    return
                }
                do {
                    let responseJSON = try JSONDecoder().decode(Currency.self, from: data)
                    callBack(nil, responseJSON)
                } catch {
                    callBack(error, nil)
                    debugPrint(error)
                }
            }
            
        }
        taskSession?.resume()
    }
    
}


