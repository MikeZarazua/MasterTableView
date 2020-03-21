//
//  POIItem.swift
//  TableViewCellTypes
//
//  Created by Mike on 12/03/20.
//  Copyright © 2020 Mike Zarazua. All rights reserved.
//

import GoogleMaps
import GoogleMapsUtils

/**
 This class  represents the Point Of Interest.
 Each POIItem  represents the markers to be managed in clusters on the map.
 **/
class POIItem: NSObject, GMUClusterItem
{
    var position: CLLocationCoordinate2D
    var name: String!
    
    init(position: CLLocationCoordinate2D, name: String) {
        self.position   = position
        self.name       = name
    }
}
