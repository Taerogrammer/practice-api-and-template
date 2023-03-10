//
//  RegisterResponse.swift
//  PracticeTemplate
//
//  Created by κΉνν on 2023/01/26.
//

struct RegisterResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: RegisterResult?
        
}

struct RegisterResult: Codable {
    var jwt : String
    var userId : Int
}
