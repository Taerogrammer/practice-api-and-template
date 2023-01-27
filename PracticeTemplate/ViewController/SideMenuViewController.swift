//
//  SideMenuViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/22.
//

import Foundation
import UIKit

class SideMenuViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarSetting()
        
    }
    
    //MARK: navigation bar setting
    func navigationBarSetting() {
        let homeImage = UIImage(named: "side3")!
        let homeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        homeButton.setImage(homeImage, for: .normal)
        homeButton.addTarget(self, action: #selector(onClickHome), for: .touchUpInside)
        let barButtonHome = UIBarButtonItem(customView: homeButton)
        
        let bellImage = UIImage(named: "side2")!
        let bellButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        bellButton.setImage(bellImage, for: .normal)
        bellButton.addTarget(self, action: #selector(onClickBell), for: .touchUpInside)
        let barButtonBell = UIBarButtonItem(customView: bellButton)
        
        let cancelImage = UIImage(named: "side1")!
        let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        cancelButton.setImage(cancelImage, for: .normal)
        cancelButton.addTarget(self, action: #selector(onClickCancel), for: .touchUpInside)
        let barButtonCancel = UIBarButtonItem(customView: cancelButton)
        
        self.navigationItem.rightBarButtonItems = [barButtonCancel, barButtonBell, barButtonHome]
    }
    
    @objc func onClickHome() {
        print("onClickHome")
    }
    @objc func onClickBell() {
        print("onClickBell")
    }
    @objc func onClickCancel() {
        print("onClickCancel")
    }
    
    
}
