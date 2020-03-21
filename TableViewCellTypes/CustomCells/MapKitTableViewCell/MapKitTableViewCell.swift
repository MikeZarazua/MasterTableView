//
//  MapKitTableViewCell.swift
//  TableViewCellTypes
//
//  Created by Mike on 20/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit
import MapKit

class MapKitTableViewCell: UITableViewCell {

    @IBOutlet weak var mapKitView: MKMapView!
    @IBOutlet weak var labelTitle: UILabel!
    // Create a location manager to trigger user tracking
    private let locationManager = CLLocationManager()
    private var model: MapKitModelItem?
    {
        didSet
        {
            guard let model = model else{
                //TODO: MAnge the erro
                return
            }
            //setcoordinates
            let initialLocation = CLLocation(latitude: model.initialLat, longitude: model.initialLng)
            centerMapOnLocation(location: initialLocation,region: CLLocationDistance(model.regionRadius))
            setPointAnnotation(with: model.initialLat, lng: model.initialLng)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mapKitView.delegate = self
//        mapKitView.register(MKAnnotationPinClass.self, forAnnotationViewWithReuseIdentifier: "Pin")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK : - Private methods
extension MapKitTableViewCell
{
    private func configureMap()
    {
       

    }
    
    private func centerMapOnLocation(location: CLLocation, region: CLLocationDistance) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: region, longitudinalMeters: region )
      mapKitView.setRegion(coordinateRegion, animated: true)
    }
    
    private func setPointAnnotation(with lat: Double, lng: Double){
        let pointAnnotation = MKPointAnnotationClass(mapView: mapKitView)
        pointAnnotation.setPinMKPointAnnotation(location: CLLocationCoordinate2D(latitude: lat, longitude: lng))
    }
}

//MARK: - MKMapViewDelegate methods -
extension MapKitTableViewCell: MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let Identifier = "Pin"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: Identifier)
          
        annotationView.canShowCallout = true
        if annotation is MKUserLocation {
            return nil
        } else if annotation is MKPointAnnotation {
            annotationView.image =  UIImage(imageLiteralResourceName: "mic")
            return annotationView
        } else {
            return nil
        }
    }
}


//MARK : MapKitTableViewCell methods
extension MapKitTableViewCell: CellCustomModelProtocol
{
    func setModel(model: TableViewCellCustomModelProtocol) {
        guard let model = model as? MapKitModelItem else {return}
        self.model = model
    }
}


class MapKitModelItem: TableViewCellCustomModelProtocol
{
    var cellType: QuestionType
    var title: String
    var regionRadius: Int
    var initialLat: Double
    var initialLng: Double
    
    init(cellType: QuestionType, title: String,regionRadius: Int, initialLat: Double, initialLng: Double) {
        self.cellType       = cellType
        self.title          = title
        self.regionRadius   = regionRadius
        self.initialLat     = initialLat
        self.initialLng     = initialLng
    }
}

