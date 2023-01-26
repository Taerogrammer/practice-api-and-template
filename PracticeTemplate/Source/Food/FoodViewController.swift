//
//  FoodViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/25.
//

import Foundation
import UIKit
import Alamofire

class FoodViewController : UIViewController {
    
    @IBOutlet weak var searchBar : UISearchBar!
    
    var lists : [Row] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    //안뇽
    

}




//MARK: search bar
extension FoodViewController : UISearchBarDelegate {
    
    private func dissmissKeyboard() {
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //키보드가 올라와 있을떄, 내려가게
        dissmissKeyboard()
        
        // 검색어가 있는지
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        
        print("검색 -> \(searchBar.text)")
        
        
    }
}

extension FoodViewController {
    func didRetrievePlaces(result: FoodResponse) {
        self.dismissIndicator()
        lists = result.placeThatDoATasteyFoodSt[1].row!
        print("didretrieveData = \(lists)")
//        searchTableView.reloadData()
    }

    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
