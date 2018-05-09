//
//  NetworkManager.swift
//  WeatherForecast
//
//  Created by Mohit Kapadia on 09/05/18.
//  Copyright © 2018 Mohit Kapadia. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private init() {
    }
    
    //shared instance
    static let shared = NetworkManager()
    
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    func startNetworkReachabilityObserver() {
        
        reachabilityManager?.listener = { status in
            switch status {
                
            case .notReachable:
                #if DEBUG
                    print("The network is not reachable")
                #endif
                
                
            case .unknown :
                #if DEBUG
                    print("It is unknown whether the network is reachable")
                #endif
                
                
            case .reachable(.ethernetOrWiFi):
                #if DEBUG
                    print("The network is reachable over the WiFi connection")
                #endif
                
                
            case .reachable(.wwan):
                #if DEBUG
                    print("The network is reachable over the WWAN connection")
                #endif

                
            }
        }
        
        // start listening
        reachabilityManager?.startListening()
    }
    
    func isNetworkAvailable() -> Bool {
        return self.reachabilityManager!.isReachable
    }
}
