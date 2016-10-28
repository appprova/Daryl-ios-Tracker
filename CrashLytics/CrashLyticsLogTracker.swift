//
//  CrashlyticsTracker.swift
//  AppProva
//
//  Created by Guilherme Castro on 6/28/16.
//  Copyright © 2016 AppProva. All rights reserved.
//

import Foundation
import Crashlytics

class CrashlyticsTracker : TrackerAdapter {
    
    func set(userProperty key: String, value: Any) {
        switch key {
        case "name":
            Crashlytics.sharedInstance().setUserName(value as? String)
        case "id":
            Crashlytics.sharedInstance().setUserIdentifier(value as? String)
        case "email":
            Crashlytics.sharedInstance().setUserEmail(value as? String)
        default:
            return
        }
    }
    
    func log(error: Error) {
        Crashlytics.sharedInstance().recordError(error)
    }    
    
    func log(event eventData: [String : Any]) {
        for (key, value) in eventData {
            CLSLogv("\(key): \(value)" , getVaList([]))
        }
    }
    
    func log(pageView pageName: String) {
        CLSLogv("pageView: \(pageName)", getVaList([]))
    }
}
