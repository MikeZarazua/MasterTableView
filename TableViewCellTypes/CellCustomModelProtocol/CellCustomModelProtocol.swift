//
//  CellModelProtocol.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import Foundation

protocol CellCustomModelProtocol
{
    //var cellType: CellInformationType { get set }
    func setModel(model: TableViewCellCustomModelProtocol)
}
