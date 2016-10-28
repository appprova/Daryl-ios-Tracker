//
//  TrackerAdapter.swift
//  Daryl
//
//  Created by Guilherme Castro on 28/10/16.
//  Copyright © 2016 AppProva. All rights reserved.
//

import Foundation

//
//  TrackerAdapter.swift
//  AppProva
//
//  Created by Guilherme Castro on 6/28/16.
//  Copyright © 2016 AppProva. All rights reserved.
//

import Foundation

protocol TrackerAdapter {
    
    func log(pageView pageName : String)
    func log(event eventData : [String:Any])
    func log(error: Error)
    func set(userProperty key: String, value:Any)
}
