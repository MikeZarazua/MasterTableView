//
//  UITableViewCellExtesion.swift
//  TableViewCellTypes
//
//  Created by Mike Zarazua on 10/15/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

extension UITableViewCell
{
    static var identifier: String
    {
        return String(describing: self)
    }
    
    static var nib: UINib
    {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
}
