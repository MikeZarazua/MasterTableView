//
//  GoogleMapTableViewCell.swift
//  TableViewCellTypes
//
//  Created by Mike on 20/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import GoogleMapsUtils

class GoogleMapTableViewCell: UITableViewCell {

    ///IBOutlets
    @IBOutlet weak var labeltitle: UILabel!
    @IBOutlet weak var googleMapViewHolder: UIView!
    private var clusterManager: GMUClusterManager!

    ///Private vars
    private var mapView: GMSMapView!
    private let locationManager = CLLocationManager()
    private var model: GoogleMapModelItem? {
        didSet
        {
            guard let model = model else {return}
            
        }
    }
    
    
    let kClusterItemCount = 10000
    let kCameraLatitude = 19.3744227
    let kCameraLongitude = -99.1609196

    
    lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage.fromLocalBundle(named: "video")
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureMapView()
        addMapAndLocationImageOnView()
        self.mapView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK : - CellCustomModelProtocol methods
extension GoogleMapTableViewCell: CellCustomModelProtocol
{
    func setModel(model: TableViewCellCustomModelProtocol) {
        guard let model = model as? GoogleMapModelItem else {return}
    }
    
    
}


class GoogleMapModelItem: TableViewCellCustomModelProtocol
{
    var cellType: QuestionType
    var title: String
    
    init(cellType: QuestionType, title: String) {
        self.cellType = cellType
        self.title = title
    }
    
}

//MARK: - private methods
extension GoogleMapTableViewCell
{
    /**
     This function configurethe mapView
    **/
    private func configureMapView()
    {
        let initLocation = locationManager.location ?? CLLocation(latitude: 19.4978, longitude: -99.1269)
        let camera = GMSCameraPosition.camera(withLatitude: initLocation.coordinate.latitude, longitude: initLocation.coordinate.longitude, zoom: 20.0)
        self.mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    }
    
    /**
     This function  add the mapView and the location to the parentview
     **/
    private func addMapAndLocationImageOnView()
    {
        self.googleMapViewHolder.addSubview(mapView)
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.mapView.leadingAnchor.constraint(equalTo: googleMapViewHolder.leadingAnchor, constant: 0).isActive = true
        self.mapView.trailingAnchor.constraint(equalTo: googleMapViewHolder.trailingAnchor, constant: 0).isActive = true
        self.mapView.topAnchor.constraint(equalTo: googleMapViewHolder.topAnchor, constant: 0).isActive = true
        self.googleMapViewHolder.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: googleMapViewHolder.bottomAnchor, constant: 0).isActive = true
        self.googleMapViewHolder.addSubview(locationImageView)
        self.locationImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.locationImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.locationImageView.centerXAnchor.constraint(equalTo: mapView.centerXAnchor, constant: 0).isActive = true
        self.locationImageView.centerYAnchor.constraint(equalTo: mapView.centerYAnchor, constant: 0).isActive = true
        SetClusterManager()
    }
    
    private func SetClusterManager()
    {
        // Set up the cluster manager with the supplied icon generator and
        // renderer.
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: mapView,
                                    clusterIconGenerator: iconGenerator)
        clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm,
                                                          renderer: renderer)

        // Generate and add random items to the cluster manager.
        generateClusterItems()

        // Call cluster() after items have been added to perform the clustering
        // and rendering on map.
        clusterManager.cluster()
    }
    
    /// Randomly generates cluster items within some extent of the camera and
    /// adds them to the cluster manager.
    private func generateClusterItems() {
      let extent = 0.2
      for index in 1...kClusterItemCount {
        let lat = kCameraLatitude + extent * randomScale()
        let lng = kCameraLongitude + extent * randomScale()
        let name = "Item \(index)"
        let item =
            POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name)
        clusterManager.add(item)
      }
    }

    /// Returns a random value between -1.0 and 1.0.
    private func randomScale() -> Double {
      return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
    }
}


//MARK : - GMSMapViewDelegate
extension GoogleMapTableViewCell: GMSMapViewDelegate
{
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        let coordinate = self.mapView.projection.coordinate(for: mapView.center)
//        mapModel?.latitude = "\(coordinate.latitude)"
//        mapModel?.longitude = "\(coordinate.longitude)"
        print("Latitude: \(coordinate.latitude)")
        print("Longitude: \(coordinate.longitude)")
    }
}


extension UIImage {
    
    static func fromLocalBundle(named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle.main, compatibleWith: nil)
    }
    
}
