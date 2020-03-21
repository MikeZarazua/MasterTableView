//
//  CameraTableViewItemProtocol.swift
//  TableViewCellTypes
//
//  Created by Mike on 20/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import Foundation

class CameraTableViewModelItem: TableViewCellCustomModelProtocol
{
    var cellType: QuestionType
    var questionModelSubtype: QuestionModelSubtype
    var title: String?
    
    init(cellType: QuestionType, questionModelSubtype: QuestionModelSubtype, title: String)
    {
        self.cellType             = cellType
        self.questionModelSubtype = questionModelSubtype
        self.title                = title
    }
}
