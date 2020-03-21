//
//  MKPlaceMarkClass.swift
//  TableViewCellTypes
//
//  Created by Mike on 14/03/20.
//  Copyright © 2020 Mike Zarazua. All rights reserved.
//

import MapKit

class MKPlaceMarkClass{
    private var mapView: MKMapView?
    
    init(mapView: MKMapView) {
        self.mapView = mapView
    }
    /**
     MKPlacemark is the simplest way to place a pin on the map. It just required coordinates of the place to where to set pin. Use this function to set pin:
     **/
    func setPinWithMKPlaceMark(location: CLLocationCoordinate2D, mapView: MKMapView){
        let pin = MKPlacemark(coordinate: location)
        let coordinateRegion = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(pin)
    }
    
}


//MARK:- MKPointAnnotation is also the simplest way to place a pin on the map.
class MKPointAnnotationClass {
    private var mapView: MKMapView?
    
    init(mapView: MKMapView) {
        self.mapView = mapView
    }
    
    /**
     MKPointAnnotation is simple to set the pin on the map
     **/
    func setPinMKPointAnnotation(location: CLLocationCoordinate2D){
        guard let mapView = mapView else { return }
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Some Title"
        annotation.subtitle = "Some subtitle"
        
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(annotation)
    }
}

//MARK: - For MKAnnotation we have to make a model class for the pin which holds the data of the pins but it doesn’t provide a visual representation for the pin on the map.
class MKAnnotationPinClass: NSObject, MKAnnotation{
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title:String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title          = title
        self.locationName   = locationName
        self.coordinate     = coordinate
    }
}

class MKAnnotationClass
{
    private var mkMapAnnotationPinClass: MKAnnotationPinClass?
    
    init(mkMapAnnotationPinClass: MKAnnotationPinClass) {
        self.mkMapAnnotationPinClass = mkMapAnnotationPinClass
    }
    
//    func setPinUsingMKAnnotation(location: CLLocationCoordinate2D) {
//       let pin1 = MapPin(title: “Here”, locationName: “Device Location”, coordinate: location)
//       let coordinateRegion = MKCoordinateRegion(center: pin1.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
//       mapView.setRegion(coordinateRegion, animated: true)
//       mapView.addAnnotations([pin1])
//    }
}
