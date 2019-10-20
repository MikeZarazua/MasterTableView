//
//  PickerTableViewModelItem.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import Foundation

class PickerTableViewModelItem: TableViewCellCustomModelProtocol
{
    //MARK: - variables
    var cellType: QuestionType
    var labelPickerText: String
    var dataSourceForPicker: [String]
    
    init(callType: QuestionType, labelPickerText: String, dataSourceForPicker: [String])
    {
        self.cellType                = callType
        self.labelPickerText         = labelPickerText
        self.dataSourceForPicker     = dataSourceForPicker
    }
}
