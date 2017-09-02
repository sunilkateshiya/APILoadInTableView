//
//  ViewController.swift
//  ContryCapital
//
//  Created by iFlame on 9/2/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    
    
    var featchCountry = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
       
        parcedata()
    }
    func parcedata() {
        featchCountry = []
        
        let url = "http://restcountries.eu/rest/v1/all"
        var request = URLRequest(url: URL(string:url)!)
        request.httpMethod = "GET"
        
        let configration = URLSessionConfiguration.default
        let session = URLSession(configuration: configration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, responce, error) in
            if (error != nil) {
                print("Error")
            }
            else
            {
                do
                {
                    let fetchData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    
                    for eachFetchCountry in fetchData {
                        let eachCountry = eachFetchCountry as! [String:Any]
                        let country = eachCountry["name"] as! String
                        let capital = eachCountry["capital"] as! String
                        
                        self.featchCountry.append(Country(country: country, capital: capital))
                    
                    
                    }
                   self.myTable.reloadData()
                }
                catch
                {
                    print("Error 2")
                }
            }
        }
        task.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featchCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:myCell = myTable.dequeueReusableCell(withIdentifier: "cell") as! myCell
        
        cell.country.text = self.featchCountry[indexPath.row].country
        cell.capital.text = self.featchCountry[indexPath.row].capital

        return cell
        
    }

    

}


class Country {
    
    var country : String
    var capital : String
    init(country : String , capital : String) {
        self.country = country
        self.capital = capital
    }
}







