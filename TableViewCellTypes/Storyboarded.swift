//
//  Storyboarded.swift
//  TableViewCellTypes
//
//  Created by Mike on 10/11/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: className, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
