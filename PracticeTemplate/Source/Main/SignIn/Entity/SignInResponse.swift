//
//  SignInResponse.swift
//  PracticeTemplate
//
//  Created by κΉνν on 2023/01/26.
//

struct SignInResponse : Decodable {
    var isSuccess: Bool
    var code : Int
    var message : String
    var result : SignInResult?
}

struct SignInResult: Decodable {
    var jwt : String
    var userIdx : Int
}
