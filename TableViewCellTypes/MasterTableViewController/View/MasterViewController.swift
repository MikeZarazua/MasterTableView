//
//  MasterViewController.swift
//  TableViewCellTypes
//
//  Created by Mike Zarazua on 10/16/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class MasterViewController: UIViewController, Storyboarded {
    /// IBOutlets
    @IBOutlet weak var tableView: UITableView!
    /// variables
    private var dataSource  : [TableViewCellCustomModelProtocol]?
    var presenter           : MasterTableViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTableView()
        getDataForTableView()
        configureIQKeyboard()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let vc = SuperUserViewController.instantiate()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Private methods
extension MasterViewController
{
    /**
     This function init the configurations setting  for tableView
     */
    private func initTableView()
    {
        tableView.delegate          = self
        tableView.dataSource        = self
        tableView.separatorStyle    = .none
        tableView.allowsSelection   = false
        tableView.register(PickerTableViewCell.nib, forCellReuseIdentifier: PickerTableViewCell.identifier)
        tableView.register(TextFieldTableViewCell.nib, forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        tableView.register(CameraTableViewCell.nib, forCellReuseIdentifier: CameraTableViewCell.identifier)
        tableView.register(GoogleMapTableViewCell.nib, forCellReuseIdentifier: GoogleMapTableViewCell.identifier)
        tableView.register(MapKitTableViewCell.nib, forCellReuseIdentifier: MapKitTableViewCell.identifier)
    }
    
    /**
     This function get theinformation data for the tableView
     **/
    private func getDataForTableView()
    {
        self.presenter?.getDataSource_Presenter()
    }
    
    /**
        This function configures the IQKeyboard
    */
    private func configureIQKeyboard()
    {
        //Keyboard and badges
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
    }
}

//MARK: - UITableViewDelegate and DataSource methods
extension MasterViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = dataSource?[indexPath.row] else {
            print("Error couldn't set let model = dataSroucer?[indexPath.row]")
            return UITableViewCell()
        }
        let identifier = presenter?.getIdentifier(object: model) ?? "Error getting identifier, presenter is null"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? CellCustomModelProtocol { cell.setModel(model: model) }
//        if let cell = cell as? ZMBCustomModelCellProtocol { cell.setModel(model: model) }

        return cell
    }
}

//MARK: - MasterTableViewPresenterToViewProtocol methods
extension MasterViewController: MasterTableViewPresenterToViewProtocol
{
    func setDataSource(dataSource: [TableViewCellCustomModelProtocol])
    {
        self.dataSource = dataSource
    }
}
