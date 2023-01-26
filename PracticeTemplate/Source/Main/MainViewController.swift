//
//  MainViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/22.
//

import Foundation
import UIKit
import Tabman
import Pageboy


class MainViewController : TabmanViewController {

    
    
    
    
    private var viewControllers: Array<UIViewController> = []
    @IBOutlet var tapmanView : UIScrollView!

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapmanSetting()


        
    }
    
    //MARK: tapman setting
    func tapmanSetting() {
        let homeVC = UIStoryboard.init(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let eventVC = UIStoryboard(name: "EventViewController" , bundle: nil).instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        let searchVC = UIStoryboard(name: "SearchViewController", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let mapVC = UIStoryboard(name: "MapViewController", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        let foodVC = UIStoryboard(name: "FoodViewController", bundle: nil).instantiateViewController(withIdentifier: "FoodViewController") as! FoodViewController
        let weatherVC = UIStoryboard(name: "WeatherViewController", bundle: nil).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        
        viewControllers.append(homeVC)
        viewControllers.append(eventVC)
        viewControllers.append(searchVC)
        viewControllers.append(mapVC)
        viewControllers.append(foodVC)
        viewControllers.append(weatherVC)
        self.dataSource = self
        
        // Create bar
         let bar = TMBar.ButtonBar()
 //        let bar = TMBar.TabBar()
         bar.backgroundView.style = .blur(style: .regular)
         bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
         bar.buttons.customize { (button) in
             button.tintColor = .white // 선택 안되어 있을 때
             button.selectedTintColor = .white // 선택 되어 있을 때
             button.font = .NotoSans(.medium, size: 14)
         }
         // 인디케이터 조정
         bar.indicator.weight = .medium
         bar.indicator.tintColor = .white
         bar.indicator.overscrollBehavior = .compress
         bar.layout.alignment = .centerDistributed
         bar.layout.contentMode = .fit
         bar.layout.interButtonSpacing = 16 // 버튼 사이 간격
     
         bar.layout.transitionStyle = .snap // Customize
        
        tapmanView.tintColor = .red

         // Add to view
         addBar(bar, dataSource: self, at: .custom(view: tapmanView, layout: nil))
        
        
        
        
    }
    


    
    
}

//MARK: tapman setting
extension MainViewController : PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
//        let item = TMBarItem(title: "")
//        item.title = "Page \(index)"
//        item.image = UIImage(named: "image.png")
//
//        return item
        
        // MARK: - Tab 안 글씨들
        switch index {
        case 0:
            return TMBarItem(title: "홈")
        case 1:
            return TMBarItem(title: "이벤트")
        case 2:
            return TMBarItem(title: "영화 검색")
        case 3:
            return TMBarItem(title: "영화관 위치 검색")
        case 4:
            return TMBarItem(title: "맛집 정보")
        case 5:
            return TMBarItem(title: "날씨 정보")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }

    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}

