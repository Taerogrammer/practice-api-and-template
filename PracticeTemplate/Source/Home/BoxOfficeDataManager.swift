//
//  BoxOfficeDataManager.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/24.
//

import Alamofire

class BoxOfficeDataManager {
    func searchDailyBoxOfficeList(targetDt: String, delegate: BoxOfficeViewController) {
        let url = "\(Constant.KOBIS_URL)key=\(kobisAppKey.kobisKey)&targetDt=\(targetDt)"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseDecodable(of: MovieResponse.self) { response in
            switch response.result {
            case .success(let response):
                delegate.didRetrieveBoxOffice(result: response.boxOfficeResult)
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
            
        }
    }

}
