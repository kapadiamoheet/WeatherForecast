//
//  SelectCityTableViewController.swift
//  WeatherForecast
//
//  Created by Mohit Kapadia on 09/05/18.
//  Copyright © 2018 Mohit Kapadia. All rights reserved.
//

import UIKit


/// Protocol: Notifies Conforming Entites about City Selection
protocol SelectCityDelegate {
    func didSelectCity(cityInfo:String)
}



class SelectCityTableViewController: UITableViewController {
    //instance Variable
    
    //Demo Data for cities
    let tableDataSource : [String] = [
        "Mumbai",
        "Pune",
        "Chennai",
        "Indore",
        "Hyderabad",
        "Bangaluru",
        "New Delhi",
        "Jaipur",
        "Lucknow"
    ]
    
    var delegate: SelectCityDelegate? = nil
    
    // MARK: - ViewController Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func setupUI(){
        self.navigationItem.title = "Select City"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableDataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellIdentifier.basicCell.rawValue, for: indexPath)
        
        cell.textLabel?.text = self.tableDataSource[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let del = self.delegate {
            let cityName = self.tableDataSource[indexPath.row]
            del.didSelectCity(cityInfo: cityName)
            self.navigationController?.popViewController(animated: true)
        }
    }

}



