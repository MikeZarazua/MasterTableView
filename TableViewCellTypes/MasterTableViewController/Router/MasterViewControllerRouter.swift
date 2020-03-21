//
//  MasterViewControllerrouter.swift
//  TableViewCellTypes
//
//  Created by Mike on 19/10/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

class MasterViewControllerRouter:MasterTableViewPresenterToRouter
{
    static func createModule() -> UIViewController {
        
        let view = MasterViewController.instantiate()
        var presenter: MasterViewControllerInteractorToPresenterOutput & MasterTableViewToPresenterProtocol = MasterViewControllerPresenter()
        let interactor: MasterTableViewPresenterToInteractorInputProtocol = MasterViewControllerInteractorInput()
        let router: MasterTableViewPresenterToRouter = MasterViewControllerRouter()
        
        view.presenter               = presenter
        presenter.view               = view
        presenter.interactorInput    = interactor
        presenter.router             = router
        interactor.presenter         = presenter
        
        return view
    }
    
    func presentViewController(vc: UIViewController) {
        print("Present view controller")
        //vc.present(, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
}
