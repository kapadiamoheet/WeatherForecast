//
//  Constant.swift
//  WeatherForecast
//
//  Created by Mohit Kapadia on 09/05/18.
//  Copyright © 2018 Mohit Kapadia. All rights reserved.
//

import Foundation
import UIKit

//MARK: ----- TypeAlias -----
typealias JsonDictionary = [String:Any]


//MARK: ------- Third Party API Keys -------
enum APIKeys : String {
    case weatherForecast = "305dc418de0ce8fe0fc84ddad6ee6e92"
}

//MARK: -----Enum WebService-----
enum API: String{
        
    //fetch using lat,lon
    case baseURL = "https://api.openweathermap.org/data/2.5/"
    
    case  rechabilityURL = "www.google.com"
    //weather?q=London,uk&APPID=305dc418de0ce8fe0fc84ddad6ee6e92
    //forecast?lat=%@&lon=%@&APPID=%@
    
    case byLocationLatLon = "forecast?lat=%@&lon=%@&APPID=%@"
    case byName = "weather?q=%@&APPID=%@"
    
}



//MARK: ------- AlertTitle Enum -------
enum AlertTitle: String
{
    case error = "Error"
    case appName = "WeatherForeCast"
}


//MARK: ------- AlertMessage --------
enum AlertMessage : String
{
    case success = "Data Fetched"
    case failed = "Unable to get weather forecast"
}


//MARK: ------- AlertButtonTitle Enum -------
enum AlertButtonTitle: String
{
    case oK = "OK"
    case cancel = "Cancel"
}


//MARK: ------ Storyboard Name Enum ------
enum StoryboardName: String{
    case Main = "Main"
    case Launch = "LaunchScreen"
}


//MARK: -----Screen Identifiers-----
enum ScreenIdentifier : String {
    case dashboardNavigation = "DashboardNavigationController"
    case dashboard = "DashboardViewController"
    case selectCity = "SelectCityTableViewController"
    
}

//MARK: -----UITableViewCell Identifiers-----
enum TableCellIdentifier : String {
    case basicCell = "BasicCell"
}

// MARK: - Storyboards
struct Storyboards{
    static let main : UIStoryboard = UIStoryboard(name: StoryboardName.Main.rawValue, bundle: nil)
}




