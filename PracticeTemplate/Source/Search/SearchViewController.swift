//
//  SearchViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/22.
//

import Foundation
import UIKit

class SearchViewController : UIViewController {
    

    @IBOutlet weak var searchBar : UISearchBar!
    
    @IBOutlet weak var searchTableView : UITableView!

    let jsonDecoder : JSONDecoder = JSONDecoder()
    var items: [Item] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

    }
    
    
    
    
    //MARK: naver movie request
    func getMovieName() {
        print("getMovieName() success")
        requestAPIToNaver(queryValue: searchBar.text ?? "")
    }
    
    func requestAPIToNaver(queryValue: String) {
        let query: String = "\(Constant.Naver_URL)query=\(queryValue)"
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
        
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue(NaverAppKey.naverIDKey, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(NaverAppKey.naverSecretKey, forHTTPHeaderField: "X-Naver-Client-Secret")

        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard error == nil else { print(error); return }
            guard let data = data else { print(error); return }
            
            do {
                let searchInfo: NaverResponse = try self.jsonDecoder.decode(NaverResponse.self, from: data)
                NaverMovie.shared.searchResult = searchInfo
                DispatchQueue.main.async {
                    self.getMovieData()
                    
                }
                
                
            } catch {
                print(fatalError())
            }
            
        }
        task.resume()
    }
    
    func getMovieData() {
        print("getMovieData() success")
//        print(NaverMovie.shared.searchResult)
        
        items = NaverMovie.shared.searchResult!.items
        print(items)
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.reloadData()
  
    }

    
}


//MARK: search bar
extension SearchViewController : UISearchBarDelegate {
    
    private func dissmissKeyboard() {
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //키보드가 올라와 있을떄, 내려가게
        dissmissKeyboard()
        
        // 검색어가 있는지
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        
        print("검색 -> \(searchBar.text)")
        
        getMovieName()
    }
}

extension SearchViewController {
    func didRetrieveData(result: NaverResponse) {
        self.dismissIndicator()
        items = result.items
        print("didretrieveData = \(items)")
        searchTableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("아이템 개수 = \(items.count)")
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NaverTableViewCell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = "\(item.title.components(separatedBy: ["<", "b",">","/"]).joined()) / \(item.subtitle)"
        print(cell.textLabel?.text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
