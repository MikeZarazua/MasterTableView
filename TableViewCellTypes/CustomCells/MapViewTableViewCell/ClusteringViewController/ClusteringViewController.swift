//
//  ClusteringViewController.swift
//  TableViewCellTypes
//
//  Created by Mike on 12/03/20.
//  Copyright © 2020 Mike Zarazua. All rights reserved.
//

import UIKit
import GoogleMapsUtils



class ClusteringViewController: UIViewController {

    //MARK: - Variables -
    private var mapView: GMSMapView!
    private var clusterManager: GMUClusterManager!
    let kClusterItemCount   = 10000
    let kCameraLatitude     = -33.8
    let kCameraLongitude    = 151.2
    let GMapZoom: Float     = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: - Private methods
extension ClusteringViewController
{
    private func setMapView()
    {
        let camera = GMSCameraPosition.camera(withLatitude: kCameraLatitude, longitude: kCameraLongitude, zoom: GMapZoom)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = view
    }
    
    /**
     Set up the cluster manager with default item generator and render.
     **/
    private func setUpClusterManager()
    {
        ///The default cluster icon generator
        let iconGenerator = GMUDefaultClusterIconGenerator()
        //The default algorithm
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        //The default Render
        let render = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
        
        clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm, renderer: render)
        
        // Generate and add random items to the cluster manager.
         generateClusterItems()

         // Call cluster() after items have been added to perform the clustering and rendering on map.
         clusterManager.cluster()
        // Register self to listen to both GMUClusterManagerDelegate and GMSMapViewDelegate events.
          clusterManager.setDelegate(self, mapDelegate: self)
    }
    
    
    private func generateClusterItems()
    {
        let extent = 0.1
        for index in 1...kClusterItemCount {
            let lat = kCameraLatitude + extent + randomScale()
            let lng = kCameraLongitude + extent + randomScale()
            let name = "Item \(index) Name"
            let item = POIItem(position: CLLocationCoordinate2D(latitude: lat, longitude: lng), name: name)
            clusterManager.add(item)
        }
    }
    
    /// Returns a random value between -1.0 and 1.0.
    private func randomScale() -> Double {
      return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
    }
}

//MARK: - GMUClusterManagerDelegate and GMSMapViewDelegate methods-
extension ClusteringViewController: GMUClusterManagerDelegate, GMSMapViewDelegate
{
    // MARK: - GMUMapViewDelegate

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
      if let poiItem = marker.userData as? POIItem {
        NSLog("Did tap marker for cluster item \(poiItem.name)")
      } else {
        NSLog("Did tap a normal marker")
      }
      return false
    }
}
