//
//  WeatherViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/26.
//

import Foundation
import UIKit
import Alamofire

class WeatherViewController : UIViewController {
    
    lazy var dataManager : WeatherDataManager = WeatherDataManager()
    var weathers = WeatherData.shared.weatherResult
    
    @IBOutlet weak var searchBar : UISearchBar!
    
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var descriptionLbl : UILabel!
    @IBOutlet weak var lonAndLat : UILabel!
    @IBOutlet weak var humidityLbl : UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("weather view did load")
        searchBar.delegate = self

    }
    
    func getCityName() {
        print("getCityName() success")
        dataManager.getWeatherData(q: searchBar.text ?? "", delegate: self)
    }
        
    
    
    
}

//MARK: search bar
extension WeatherViewController : UISearchBarDelegate {
    
    private func dissmissKeyboard() {
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //키보드가 올라와 있을떄, 내려가게
        dissmissKeyboard()
        
        // 검색어가 있는지
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        
        print("검색 -> \(searchBar.text)")
        
        getCityName()
        
    }
}


//MARK: data
extension WeatherViewController {
    func didRetrieveWeatherData(result: WeatherResponse) {
        self.dismissIndicator()
        print("didRetrieve() Success")
//        print(result)
        
        weathers = result
        print(weathers)
        
        print(weathers?.weather.description)
        print(weathers?.name)
        DispatchQueue.main.async {
            self.nameLbl.text = self.weathers?.name
            self.descriptionLbl.text = self.weathers?.weather.description
            self.lonAndLat.text = "\(self.weathers?.coord.lat) // \(self.weathers?.coord.lon)"
            self.humidityLbl.text = "\(self.weathers?.main.humidity)"
        }
        
        
    }
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
