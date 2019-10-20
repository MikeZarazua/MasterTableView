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
        dataSource.append(textField1)
        dataSource.append(pickerView1)
        
        presenter?.setDataSource_InteractorOutput(dataSource: dataSource)
    }
    
    func getIdentifier(object: TableViewCellCustomModelProtocol) -> String {
        return cellIdentifierMaper.getIdentifierFor(object: object)//.getIdentifier(object: object)
    }
}

