//
//  TextFieldModelItem.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import Foundation

class TextFieldModelItem: TableViewCellCustomModelProtocol
{
    var cellType: QuestionType
    var labeltext: String
    var textFieldResponse: String
    
    init(cellType: QuestionType, labelText: String, textFieldResponse: String)
    {
        self.cellType            = cellType
        self.labeltext           = labelText
        self.textFieldResponse   = textFieldResponse
    }
}


enum QuestionType: Int
{
    case textField    = 1
    case picker       = 2
    case video        = 3
    case camera       = 4
    case mapKit       = 5
    case mapView      = 6
}
