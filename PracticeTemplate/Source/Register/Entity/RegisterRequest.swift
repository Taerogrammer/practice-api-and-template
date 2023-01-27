//
//  RegisterResponse.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/26.
//

struct RegisterRequest: Codable {
    
    var email : String
    var loginId : String
    var nickname: String
    var password: String
    var phoneNumber : String
    var userName : String
 
}
