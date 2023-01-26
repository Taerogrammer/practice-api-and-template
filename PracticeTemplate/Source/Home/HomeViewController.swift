//
//  HomeViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/22.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    //MARK: big segment control
    @IBOutlet weak var chartView : UIView!
    @IBOutlet weak var comingView : UIView!
    @IBOutlet weak var bigSegmentControl : UISegmentedControl!
    @IBAction func switchBigViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            chartView.isHidden = false
            comingView.isHidden = true
        }
        else {
            chartView.isHidden = true
            comingView.isHidden = false
        }
    }
    func defaultBigSegment() {
        chartView.isHidden = false
        comingView.isHidden = true
        
        let backgroundImage = UIImage()
        self.bigSegmentControl.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.bigSegmentControl.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.bigSegmentControl.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        let deviderImage = UIImage()
        self.bigSegmentControl.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.bigSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.bigSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .selected)

    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("Home did load")
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        bannerMove()
        defaultBigSegment()
        
        
    }
    
    //MARK: collection view
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0

    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "home1")!, UIImage(named: "home2")!, UIImage(named: "home3")!, UIImage(named: "home4")!]
    
    // 2초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == dataArray.count-1 {
        // 맨 처음 페이지로 돌아감
            homeCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        homeCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    
    
    
}

//MARK: collection View
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCell", for: indexPath) as! HomeBannerCell
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homeCollectionView.frame.size.width  , height:  homeCollectionView.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
