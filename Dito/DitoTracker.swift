//
//  DitoTracker.swift
//  AppProva
//
//  Created by Guilherme Castro on 6/29/16.
//  Copyright © 2016 AppProva. All rights reserved.
//

import Foundation

class DitoTracker : TrackerAdapter {
    
    func log(error: Error) {

    }

    func set(userProperty key: String, value: Any) {
        
    }
    
    func log(event eventData: [String : Any]) {
        let app = UIApplication.shared.delegate as? AppDelegate
        var newDict = eventData
        newDict["data"] = eventData
        DitoAPI.track(app?.ditoCredential, event: newDict) { (object, error) in
            if let ditoError = error {
                NSLog("Error tracking ditto event : \(ditoError.localizedDescription)")
            }
        }
    }
    
    func log(pageView pageName: String) {
        
    }
}
