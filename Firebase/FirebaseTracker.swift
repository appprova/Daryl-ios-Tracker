//
//  FirebaseTracker.swift
//  AppProva
//
//  Created by Guilherme Castro on 6/30/16.
//  Copyright © 2016 AppProva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseCrash

class FirebaseTracker : TrackerAdapter {
    
    func set(userProperty key: String, value: Any) {
        FIRAnalytics.setUserPropertyString(key, forName: sanatize(string: value))
    }

    func log(error: Error) {
        
    }
    
    func log(pageView pageName: String) {
        FIRAnalytics.logEvent(withName: "pageView", parameters: ["pageName" : sanatize(string: pageName) as NSObject])
        FIRCrashMessage("pageView: \(sanatize(string: pageName))")
    }
    
    
    func log(event eventData : [String:Any]) {
        let sanatizedDictonary = sanatize(dictonary: eventData)
        if let eventAction = sanatizedDictonary["action"] as? String {
            FIRAnalytics.logEvent(withName: sanatize(string: eventAction), parameters: sanatizedDictonary)
            FIRCrashMessage("eventAction: \(eventAction) properties: \(eventData)")
        }
    }


    private func sanatize(dictonary:[String: Any]) -> [String: NSObject] {
        var sanatizedDictonary = [String: NSObject]()
        for (key, value) in dictonary {
            sanatizedDictonary[key] = NSString(utf8String: sanatize(string: value))
        }
        return sanatizedDictonary
    }
    
    private func sanatize(string value:Any) -> String {
        return String(describing: value)
            .replacingOccurrences(of: "-", with: "_")
            .replacingOccurrences(of: " ", with: "_")
    }
    
}
