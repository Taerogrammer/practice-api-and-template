//
//  RegisterViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/26.
//

import Foundation
import UIKit

class RegisterViewController : UIViewController {
    
    @IBOutlet weak var userNameTextField : UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var loginIdTextField : UITextField!
    @IBOutlet weak var nicknameTextField : UITextField!
    @IBOutlet weak var phoneNumberTextField : UITextField!
    
    lazy var dataManager : RegisterDataManager = RegisterDataManager()

    
    
    @IBAction func didTapped(_ sender : AnyObject) {
        guard let userName = userNameTextField.text?.trim, userName.isExists else {
            self.presentAlert(title: "userName을 입력해주세요")
            return
        }
        guard let password = passwordTextField.text?.trim, password.isExists else {
            self.presentAlert(title: "password를 입력해주세요")
            return
        }
        guard let email = emailTextField.text?.trim, email.isExists else {
            self.presentAlert(title: "eamil을 입력해주세요")
            return
        }
        guard let loginId = loginIdTextField.text?.trim, loginId.isExists else {
            self.presentAlert(title: "loginIdTextField을 입력해주세요")
            return
        }
        guard let nickname = nicknameTextField.text?.trim, nickname.isExists else {
            self.presentAlert(title: "nickname을 입력해주세요")
            return
        }
        guard let phoneNumber = phoneNumberTextField.text?.trim, phoneNumber.isExists else {
            self.presentAlert(title: "phoneNumber을 입력해주세요")
            return
        }
        
        print("success")
        
        //Request Register
        self.dismissKeyboard()
        self.showIndicator()
        let input = RegisterRequest(email: email, loginId: loginId, nickname: nickname, password: password, phoneNumber: phoneNumber, userName: userName)
        dataManager.postRegister(input, delegate: self)
    }
    
    
    
    
    
    
}


extension RegisterViewController {
    func didSuccessRegister(_ result: RegisterResult) {
        self.presentAlert(title: "회원가입 성공", message: "회원가입에 성공하였습니다")
        //result.jwt
        print("get jwt")
        let userIdentifier = result.jwt
        UserDefaults.standard.set(userIdentifier, forKey: "LoginIdentifier")
                        
        print(UserDefaults.standard.string(forKey: "LoginIdentifier"))
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
