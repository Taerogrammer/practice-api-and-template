//
//  MapViewController.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/22.
//

import Foundation
import UIKit
import NMapsMap
import CoreLocation
import Alamofire

class MapViewController : UIViewController, CLLocationManagerDelegate {
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("map did load")
        setCamera()
    }
    
    func setCamera() {

        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        let camera = mapView.cameraPosition
        print(camera)
        let camPosition = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        let cameraUpdate = NMFCameraUpdate(scrollTo: camPosition)
        mapView.moveCamera(cameraUpdate)
        
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.5670135, lng: 12.9783740)
        marker.iconImage = NMF_MARKER_IMAGE_BLACK
        marker.iconTintColor = UIColor.red
        marker.width = 50
        marker.height = 60
        marker.mapView = mapView
        
        let infoWindow = NMFInfoWindow()
        let dataSource = NMFInfoWindowDefaultTextSource.data()
        dataSource.title = "서울특별시청"
        infoWindow.dataSource = dataSource
        
        infoWindow.open(with: marker)
        
    }

}
