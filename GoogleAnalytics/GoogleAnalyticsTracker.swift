//
//  GoogleAnalyticsTracker.swift
//  AppProva
//
//  Created by Guilherme Castro on 6/28/16.
//  Copyright © 2016 AppProva. All rights reserved.
//

import Foundation

class GoogleAnalyticsTracker : TrackerAdapter {
    
    func set(userProperty key: String, value: Any) {
    }
    
    func log(error: Error) {
        
    }

    func log(event eventData: [String : Any]) {
        let tracker = GAI.sharedInstance().defaultTracker
        if let trackDictionary = GAIDictionaryBuilder.createEvent(withCategory: eventData["category"] as? String,
                                                                           action: eventData["action"] as? String,
                                                                           label: eventData["label"] as? String,
                                                                           value: eventData["value"] as? NSNumber).build() {
            tracker?.send(trackDictionary  as Dictionary)
        }
    }

    func log(pageView pageName: String) {
        if let tracker = GAI.sharedInstance().defaultTracker {
            tracker.allowIDFACollection = true
            tracker.set(kGAIScreenName, value: pageName)
            tracker.send(GAIDictionaryBuilder.createScreenView().build() as Dictionary)
        }
    }
}
