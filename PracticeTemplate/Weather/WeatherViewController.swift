//
//  WeatherViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/26.
//

import Foundation
import UIKit

class WeatherViewController : UIViewController {
    
    lazy var dataManager : WeatherDataManager = WeatherDataManager()
//    var infos = WeatherResponse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("weather view did load")
        dataManager.getWeatherData(q: "seoul", delegate: self)
    }
    
    
    
    
    
    
}

extension WeatherViewController {
    func didRetrieveWeatherData(result: WeatherResponse) {
        self.dismissIndicator()
        print("didRetrieve() Success")
        
//        infos = result
//        print(infos)
        
    }
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
