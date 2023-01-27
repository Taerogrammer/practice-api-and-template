//
//  ViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/21.
//

import UIKit


class ViewController: UIViewController {
    
    lazy var dataManager : SignInDataManager = SignInDataManager()
    
    @IBOutlet weak var IDLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    
    var idText: String = ""
    var passwordText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    
    @IBAction func loginTapped(_ sender : AnyObject) {
        print("loginTapped() success")
        //ID validation
        guard let id = IDLbl.text?.trim, id.isExists else {
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        //Password validation
        guard let password = passwordLbl.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        //Request Sign In
        self.dismissKeyboard()
        self.showIndicator()
        let input = SignInRequest(loginId: id, password: password)
        dataManager.postSignIn(input, delegate: self)
        
        print("finished")
        
    }
    
    
}

extension ViewController {
    func didSuccessSignIn(_ result: SignInResult) {
        self.presentAlert(title: "로그인 성공", message: "로그인에 성공하였습니다")
        //result.jwt
        print("get jwt")
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"MainViewController")else{return}
            self.navigationController?.pushViewController(nextVC, animated: true)
        }

                
                                              
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
