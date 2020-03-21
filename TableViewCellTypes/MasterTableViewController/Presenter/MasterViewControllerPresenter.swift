//
//  MasterViewControllerPresenter.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import Foundation

class MasterViewControllerPresenter: MasterTableViewToPresenterProtocol
{
   
    ///Variables from protocol
    weak var view: MasterTableViewPresenterToViewProtocol?
    var interactorInput: MasterTableViewPresenterToInteractorInputProtocol?
    var router: MasterTableViewPresenterToRouter?
    
    /**
        This funtcion order to the interactor intput to get some information
     **/
    func getDataSource_Presenter() {
        self.interactorInput?.getDataSource_InteractorInput()
    }
    
    /**
     This fucntion get the identifier for determinate cell
    */
    func getIdentifier(object: TableViewCellCustomModelProtocol) ->String
    {
        return interactorInput?.getIdentifier(object: object) ?? "Couldnt get interactorInput?.getIdentifier(object: object)"
    }
}

//MARK: - InteractorOutput protocol methods
extension MasterViewControllerPresenter: MasterViewControllerInteractorToPresenterOutput
{
    func setDataSource_InteractorOutput(dataSource: [TableViewCellCustomModelProtocol]) {
        view?.setDataSource(dataSource: dataSource)
    }
}
