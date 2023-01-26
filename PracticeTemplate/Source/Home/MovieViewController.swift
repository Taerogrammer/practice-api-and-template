//
//  MovieViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/24.
//

import UIKit

class MovieViewController : UIViewController {
    
    var movie: Movie!
    
    @IBOutlet weak var rankLbl : UILabel!
    @IBOutlet weak var movieName : UILabel!
    @IBOutlet weak var openDate : UILabel!
    @IBOutlet weak var audiAccLbl : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("detail did load")
        detailMovieInfo()

        
    }
    
    
    func detailMovieInfo() {
        rankLbl.text = "\(movie.rank)위"
        rankLbl.font = .NotoSans(.bold, size: 12)
        movieName.text = movie.movieNm
        movieName.font = .NotoSans(.bold, size: 12)
        openDate.text = movie.openDt
        openDate.font = .NotoSans(.bold, size: 12)
        audiAccLbl.text = "\(movie.audiAcc.insertComma)명"
        audiAccLbl.font = .NotoSans(.bold, size: 12)
    }
    
    
    
}
