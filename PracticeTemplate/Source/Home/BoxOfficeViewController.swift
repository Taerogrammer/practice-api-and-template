//
//  BoxOfficeViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/24.
//

import Foundation
import UIKit

class BoxOfficeViewController : UIViewController {
    
    lazy var dataManager : BoxOfficeDataManager = BoxOfficeDataManager()
    @IBOutlet weak var boxOfficeTableView : UITableView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table View
        boxOfficeTableView.delegate = self
        boxOfficeTableView.dataSource = self
        
        //Request Box Offfice
        self.showIndicator()
        dataManager.searchDailyBoxOfficeList(targetDt: "20230123", delegate: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BoxOfficeTableViewCellSegue",
           let movieInfoViewController = segue.destination as? MovieViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = boxOfficeTableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            movieInfoViewController.movie = movie
        }
         
    }
    
}

extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeTableViewCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = "\(movie.rank). \(movie.movieNm)"
        cell.detailTextLabel?.text = movie.openDt
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BoxOfficeViewController {
    func didRetrieveBoxOffice(result: boxOfficeResult) {
        self.dismissIndicator()
        movies = result.dailyBoxOfficeList
        boxOfficeTableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
