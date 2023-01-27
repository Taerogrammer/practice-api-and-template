//
//  SignInDataManager.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/26.
//

import Alamofire

class SignInDataManager {
    func postSignIn(_ parameter: SignInRequest, delegate: ViewController) {
        AF.request("\(Constant.Login_URL)/app/users/logIn", method: .post, parameters: parameter, encoder: JSONParameterEncoder(), headers: nil).validate().responseDecodable(of: SignInResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    delegate.didSuccessSignIn(result)
                }
                else {
                    switch response.code {
                    case 2000: delegate.failedToRequest(message: "request 오류입니다")
                    case 3000: delegate.failedToRequest(message: "response 오류입니다")
                    case 4000: delegate.failedToRequest(message: "DB 또는 서버 오류입니다")
                    default: delegate.failedToRequest(message: "그냥 오류입니다")
                    }
                }
                
            case .failure(let error):
                print(error)
                delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
            
        }
    }
    
}
