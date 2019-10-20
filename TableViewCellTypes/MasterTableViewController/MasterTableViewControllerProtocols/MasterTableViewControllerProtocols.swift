//
//  MasterTableViewControllerProtocols.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

///Presenter -> View
protocol MasterTableViewPresenterToViewProtocol: NSObject
{
    func setDataSource(dataSource: [TableViewCellCustomModelProtocol])
}

///View -> Presenter
protocol MasterTableViewToPresenterProtocol
{
    var view:            MasterTableViewPresenterToViewProtocol? {get set}
    var interactorInput: MasterTableViewPresenterToInteractorInputProtocol? {get set}
    var router:          MasterTableViewPresenterToRouter? {get set}
    
    func getDataSource_Presenter()
    func getIdentifier(object: TableViewCellCustomModelProtocol) ->String
}

///Presenter -> router
protocol MasterTableViewPresenterToRouter
{
    static func createModule() -> UIViewController
    ///This fucntion receieves a viewcontroller to present
    func presentViewController(vc: UIViewController)
}

///Presenter -> Interactor
protocol MasterTableViewPresenterToInteractorInputProtocol: class
{
    var presenter: MasterViewControllerInteractorToPresenterOutput? {get set}
    func getDataSource_InteractorInput()
    func getIdentifier(object: TableViewCellCustomModelProtocol) -> String
}

///Interactor -> Presenter
protocol MasterViewControllerInteractorToPresenterOutput: class
{
    func setDataSource_InteractorOutput(dataSource: [TableViewCellCustomModelProtocol])
}




