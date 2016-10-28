//
//  MultipleTrackerAdapter.swift
//  AppProva
//
//  Created by Guilherme Castro on 6/28/16.
//  Copyright © 2016 AppProva. All rights reserved.
//

import Foundation

class MultipleTrackerAdapter: TrackerAdapter {
    
    static let sharedInstance = MultipleTrackerAdapter()
    var trackers = [TrackerAdapter]()
    
    func log(event eventData: [String : Any]) {
        for tracker in MultipleTrackerAdapter.sharedInstance.trackers {
            tracker.log(event: eventData)
        }
    }
    
    func log(pageView pageName: String) {
        for tracker in MultipleTrackerAdapter.sharedInstance.trackers {
            tracker.log(pageView: pageName)
        }
    }
    
    func add(tracker : TrackerAdapter) {
        MultipleTrackerAdapter.sharedInstance.trackers.append(tracker)
    }
    
    func set(userProperty key: String, value: Any) {
        for tracker in MultipleTrackerAdapter.sharedInstance.trackers {
            tracker.set(userProperty: key, value: value)
        }
    }
    
    func log(error: Error) {
        for tracker in MultipleTrackerAdapter.sharedInstance.trackers {
            tracker.log(error: error)
        }
    }
}
