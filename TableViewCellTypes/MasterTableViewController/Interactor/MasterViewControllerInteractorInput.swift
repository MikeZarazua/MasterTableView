//
//  MasterViewControllerInteractorInput.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import Foundation

class MasterViewControllerInteractorInput: MasterTableViewPresenterToInteractorInputProtocol
{
    weak var presenter: MasterViewControllerInteractorToPresenterOutput?
    private var cellIdentifierMaper = CellToIdentifier()
    func getDataSource_InteractorInput() {
        print("Implement Dummy data here")
        var dataSource = [TableViewCellCustomModelProtocol]()
        
        let textField1 = TextFieldModelItem(cellType: .textField, labelText: "TextField Generic Value", textFieldResponse: "Some respons epreviously getted")
        let pickerView1 = PickerTableViewModelItem(callType: .picker, labelPickerText: "PickerView Generic Value", dataSourceForPicker: ["Value1", "Value2", "Value3"])
        let imagePhotoView = CameraTableViewModelItem(cellType: .multimedia, questionModelSubtype: .multimediaImage,title: "Image photoImage photoImage photoImage photoImage photoImage photoImage photoImage photoImage photoImage photoImage photoImage photo")
        let imageVideoView = CameraTableViewModelItem(cellType: .multimedia, questionModelSubtype: .multimediaVideo,title: "Image video")
        let imageAudioView = CameraTableViewModelItem(cellType: .multimedia, questionModelSubtype: .multimediaAudio,title: "Image aurdio")
        let imageAttahmentView = CameraTableViewModelItem(cellType: .multimedia, questionModelSubtype: .multimediaAttahment,title: "Image AttachmentImage AttachmentImage AttachmentImage AttachmentImage AttachmentImage AttachmentImage AttachmentImage AttachmentImage Attachment")
        let googleMapView = GoogleMapModelItem(cellType: .mapView, title: "Some title for the map")
        //let mapkit = MapKitModelItem(cellType: .mapKit, title: "Map Kit")
        let mapkit = MapKitModelItem(cellType: .mapKit, title: "MapKit", regionRadius: 10, initialLat: 21.282778, initialLng: -157.829444)
        print("Other")
        
        dataSource.append(imageAudioView)
        dataSource.append(imagePhotoView)
        dataSource.append(imageVideoView)
        dataSource.append(imageAttahmentView)
        dataSource.append(textField1)
        dataSource.append(pickerView1)
        dataSource.append(googleMapView)
        dataSource.append(pickerView1)
        dataSource.append(mapkit)
        
        presenter?.setDataSource_InteractorOutput(dataSource: dataSource)
    }
    
    func getIdentifier(object: TableViewCellCustomModelProtocol) -> String {
        return cellIdentifierMaper.getIdentifierFor(object: object)//.getIdentifier(object: object)
    }
}

