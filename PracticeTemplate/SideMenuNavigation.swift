//
//  SideMenuNavigation.swift
//  PracticeTemplate
//
//  Created by κΉνν on 2023/01/22.
//

import Foundation
import SideMenu

class SideMenuNavigation : SideMenuNavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentationStyle = .menuSlideIn
        self.menuWidth = self.view.frame.width * 0.9
        self.statusBarEndAlpha = 0.0
        
    }
    
    
}
