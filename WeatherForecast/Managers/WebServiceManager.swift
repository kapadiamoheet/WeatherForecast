//
//  WebServiceManager.swift
//  WeatherForecast
//
//  Created by Mohit Kapadia on 09/05/18.
//  Copyright © 2018 Mohit Kapadia. All rights reserved.
//

import Foundation
import Alamofire

class WebServiceManager: NSObject {
    
    
    /*Enum - Error Message and Code*/
    enum ErrorMessage : Int
    {
        case noInternet
        case noData
        case unknown
        
        func errorDescription()->(errorMessage:String,errorCode:Int)
        {
            var message = ""
            
            switch self {
            case .noInternet:
                message = "Internet not available"
                
            case .noData:
                message = "No Data found"
                
            default:
                message = "An unexpected error occurred. Please try again."
                
            }
            
            return (message,self.rawValue)
        }
    }
    
    
    /// Description:
    ///
    /// - Parameters:
    ///   - url: service URL
    ///   - methodType: HTTP method name
    ///   - serviceName: webservice name
    ///   - successHandler: success block
    ///   - failureHandler: failure block
    /// - Returns: dataTask object
    class func sendRequest(_ url:URL,requestParam:Parameters?,methodType:HTTPMethod?,successHandler:@escaping (Any?,Parameters?)->Void,failureHandler:@escaping (ErrorEntity,Parameters?)->Void)->URLSessionDataTask?
    {
        let currentTask : URLSessionDataTask = URLSessionDataTask()
        var dataRequest: DataRequest? = nil
        
        if NetworkManager.shared.isNetworkAvailable(){
            //show network indicator
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            
            dataRequest = Alamofire.request(url, method: .get, parameters: requestParam, encoding: JSONEncoding.default, headers: nil)
            
            dataRequest?.validate()
            
            /*Response JSON Handler - Serialized into Any*/
            dataRequest?.responseJSON(completionHandler: { (responseJson) in
                //Hide network indicator
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch responseJson.result {
                case .success:
                    successHandler(responseJson.result.value, requestParam)
                case .failure(let error):
                    #if DEBUG
                        print("inClass->\(self.classForCoder), inFunc->\(#function), atLine->\(#line):" + "\(error)" )
                    #endif
                    let errorInfo = ErrorMessage(rawValue: ErrorMessage.unknown.rawValue)
                    let errorEntity = ErrorEntity(message:errorInfo!.errorDescription().errorMessage , code: errorInfo!.errorDescription().errorCode)
                    failureHandler(errorEntity, requestParam)
                }
            })
        }else{
            //No internet
            let errorInfo = ErrorMessage(rawValue: ErrorMessage.noInternet.rawValue)
            let errorEntity = ErrorEntity(message:errorInfo!.errorDescription().errorMessage , code: errorInfo!.errorDescription().errorCode)
            DispatchQueue.main.async {
                failureHandler(errorEntity, requestParam)
            }
        }
        
        return currentTask
    }
    
    
    
    
}




