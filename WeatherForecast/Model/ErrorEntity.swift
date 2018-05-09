//
//  ErrorEntity.swift
//  WeatherForecast
//
//  Created by Mohit Kapadia on 09/05/18.
//  Copyright © 2018 Mohit Kapadia. All rights reserved.
//

import Foundation

class ErrorEntity: NSObject {
    var errorMessage: String?
    var errorCode : Int?
    override init() {
        self.errorMessage = nil
        self.errorCode = nil
    }
    
    init(message:String,code:Int)
    {
        self.errorMessage = message
        self.errorCode = code
    }
}
