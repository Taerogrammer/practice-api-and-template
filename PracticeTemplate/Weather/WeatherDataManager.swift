//
//  WeatherDataManager.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/26.
//

import Foundation
import Alamofire

class WeatherDataManager {
    func getWeatherData(q: String, delegate: WeatherViewController) {
        let url = "\(Constant.Weather_URL)q=\(q)&appid=\(WeatherAppkey.weatherKey)"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let response):
                delegate.didRetrieveWeatherData(result: response)
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
        }
    }
}
