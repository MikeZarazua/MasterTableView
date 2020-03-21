//
//  CellToIdentifier.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import Foundation

class CellToIdentifier
{
    func getIdentifierFor(object: TableViewCellCustomModelProtocol) -> String
    {
        switch object
        {
            case is TextFieldModelItem:
                return TextFieldTableViewCell.identifier
            case is PickerTableViewModelItem:
                return PickerTableViewCell.identifier
            case is CameraTableViewModelItem:
                return CameraTableViewCell.identifier
            case is GoogleMapModelItem:
                return GoogleMapTableViewCell.identifier
            case is MapKitModelItem:
                return MapKitTableViewCell.identifier
            default:
                return "modelProtocolItem Unexpected Type"
        }
    }
}
