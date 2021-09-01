//
//  Translation.swift
//  Le Baluchon
//
//  Created by Anthony TUFFERY on 11/08/2021.
//

import Foundation

class TranslationManager {
    
    private var session: URLSession
    private var taskSession: URLSessionDataTask?
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func initTranslation(textToTranslate: String, source: String, target: String) -> URLRequest? {
        let source = "&source=\(source)"
        let target = "&target=\(target)"
        let format = "&format=text&q=\(textToTranslate)".addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)
        guard let translationUrl = URL(string: URLApiList.getUrl(.googleTranslateApi)() + source + target + format!) else { return nil}
        var request = URLRequest(url: translationUrl)
        request.httpMethod = "POST"
        return request
    }
    
    func getTranslation(TextToTranslate: String, source: String, target: String, callBack: @escaping (Error?, Translation?) -> Void) {
        guard let url = initTranslation(textToTranslate: TextToTranslate, source: source, target: target) else { return }
        
        taskSession?.cancel()
        
        taskSession = session.dataTask(with: url) {data,response,error in
            
            DispatchQueue.main.async {
                guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callBack(error,nil)
                   
                    return
                }
                do {
                    let responseJSON = try JSONDecoder().decode(Translation.self, from: data)
                    callBack(nil, responseJSON)
                    debugPrint(data)
                
                } catch {
                    callBack(error, nil)
                    debugPrint(error)
                    
                }
            }
            
        }
        taskSession?.resume()
    }
    
}
