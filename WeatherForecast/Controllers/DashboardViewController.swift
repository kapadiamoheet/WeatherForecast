//
//  DashboardViewController.swift
//  WeatherForecast
//
//  Created by Mohit Kapadia on 09/05/18.
//  Copyright © 2018 Mohit Kapadia. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController {

    @IBOutlet weak var selectCityTF: UITextField!
    
    
    // MARK: - ViewController Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.textFieldTextDidChange(sender:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
    }
    
    
    func setupUI(){
        self.selectCityTF.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func textFieldTextDidChange(sender: Notification) {
        if let textField = sender.object as? UITextField {
            }
    }
    
    
 
}


// MARK: - UITextFieldDelegate Methods
extension DashboardViewController : UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let vc = Storyboards.main.instantiateViewController(withIdentifier: ScreenIdentifier.selectCity.rawValue) as? SelectCityTableViewController {
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return false
    }
    
}


// MARK: - SelectCityDelegate Methods
extension DashboardViewController : SelectCityDelegate {
    
    /// Delegate Method Called when City is Selected
    ///
    /// - Parameter cityInfo: String, Detail of the Selected City
    func didSelectCity(cityInfo: String) {
        #if DEBUG
            print("City selected:\(cityInfo)")
        #endif
        
        self.selectCityTF.text = cityInfo
        
            //Call service to get weather Information
            //                    "weather?q=%@&APPID=%@"
            let byNamAPI = String(format: API.byName.rawValue, cityInfo, APIKeys.weatherForecast.rawValue)
            let api = API.baseURL.rawValue + byNamAPI
            
            if let url = URL(string:api) {
               let _ = WebServiceManager.sendRequest(url, requestParam: nil, methodType: nil, successHandler: { (responseObj, requestParams) in
                    if let res = responseObj{
                        print(res)
                    }
                }, failureHandler: { (errorEntity, requestParams) in
                    print(errorEntity)
                })
            }            
    }
}
