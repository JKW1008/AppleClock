//
//  CitySelectionViewController.swift
//  AppleClock
//
//  Created by 정강우 on 4/4/24.
//

import UIKit

struct Item {
    let title: String
    let timeZone: TimeZone
}

struct Section {
    let title: String
    let times: [Item]
}

class CitySelectionViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    
    var list = [Section]()
    
    func setupList() {
        var dict = [String: [TimeZone]]()
        
        for id in TimeZone.knownTimeZoneIdentifiers {
            guard let city = id.components(separatedBy: "/").last else { continue }
            
            var timeZoneList = [TimeZone(identifier:  id)!]
            let key = city.chosung ?? "Unknown"
            
            if let list = dict[key] {
                timeZoneList.append(contentsOf: list)
            }
            
            dict[key] = timeZoneList
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
