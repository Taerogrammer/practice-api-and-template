//
//  HomeSegViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/24.
//

import UIKit

class HomeSegViewController : UIViewController {
    
    
    //MARK: small segment control
    @IBOutlet weak var boxOfficeView : UIView!
    @IBOutlet weak var nowView : UIView!
    @IBOutlet weak var ICEView : UIView!
    @IBOutlet weak var artHouseView : UIView!
    @IBOutlet weak var etcView : UIView!
    @IBOutlet weak var smallSegmentControl : UISegmentedControl!
    @IBAction func switchSmallViews (_ sender : UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            boxOfficeView.isHidden = false
            nowView.isHidden = true
            ICEView.isHidden = true
            artHouseView.isHidden = true
            etcView.isHidden = true
        }
        else if sender.selectedSegmentIndex == 1 {
            boxOfficeView.isHidden = true
            nowView.isHidden = false
            ICEView.isHidden = true
            artHouseView.isHidden = true
            etcView.isHidden = true
        }
        else if sender.selectedSegmentIndex == 2 {
            boxOfficeView.isHidden = true
            nowView.isHidden = true
            ICEView.isHidden = false
            artHouseView.isHidden = true
            etcView.isHidden = true
        }
        else if sender.selectedSegmentIndex == 3 {
            boxOfficeView.isHidden = true
            nowView.isHidden = true
            ICEView.isHidden = true
            artHouseView.isHidden = false
            etcView.isHidden = true
        }
        else if sender.selectedSegmentIndex == 4 {
            boxOfficeView.isHidden = true
            nowView.isHidden = true
            ICEView.isHidden = true
            artHouseView.isHidden = true
            etcView.isHidden = false
        }
    }
    
    func defaultSeg() {
        boxOfficeView.isHidden = false
        nowView.isHidden = true
        ICEView.isHidden = true
        artHouseView.isHidden = true
        etcView.isHidden = true
        
        let backgroundImage = UIImage()
        self.smallSegmentControl.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.smallSegmentControl.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.smallSegmentControl.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        let deviderImage = UIImage()
        self.smallSegmentControl.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.smallSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.smallSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12 , weight:.medium)], for: .selected)
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        defaultSeg()
    }
        
        
        
        
    
    
    
}
