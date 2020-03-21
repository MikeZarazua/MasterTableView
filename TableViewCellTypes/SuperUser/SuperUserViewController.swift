//
//  SuperUserViewController.swift
//  TableViewCellTypes
//
//  Created by Mike on 10/11/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit


class SuperUserViewController: UIViewController, Storyboarded {

    /// IBOutlets
    @IBOutlet weak var tableView    : UITableView!
    /// private methods
    private var presenter           = SuperUserPresenter()
    private var dataSource          : [TableViewCellCustomModelProtocol]?
    {
        didSet{
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTableView()
        setPresenter()
        getData()
    }

}

//MARK : - Private mthods
extension SuperUserViewController
{
    private func initTableView()
    {
        self.tableView.delegate                      = self
        self.tableView.dataSource                    = self
        self.tableView.estimatedRowHeight            = 70
        self.tableView.rowHeight                     = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight  = 40
        self.tableView.sectionHeaderHeight           = 40
        self.tableView.register(PickerTableViewCell.nib, forCellReuseIdentifier: PickerTableViewCell.identifier)
        self.tableView.register(HeaderViewCell.nib, forCellReuseIdentifier: HeaderViewCell.identifier)
    }

    private func setPresenter()
    {
        self.presenter.viewPresenter = self
    }
    
    private func getData()
    {
        self.presenter.getDataSource()
    }
}
//MARK : - TableView Delegate & DataSource methods
extension SuperUserViewController:ViewPresenter
{
    func setDataSource(dataSource: [TableViewCellCustomModelProtocol])
    {
        self.dataSource = dataSource
    }
}

//MARK : - TableView Delegate & DataSource methods
extension SuperUserViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: PickerTableViewCell.identifier, for: indexPath) as? PickerTableViewCell else
        {
            return cell
        }
        customCell.setModel(model: (self.dataSource?[indexPath.row])!)
        cell = customCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.identifier) as? HeaderViewCell else {
            print("Couldn't set  let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.identifier) as? HeaderViewCell")
            return nil
        }
        cell.labelTitle.text = "Some title Here, add this into a model"
        return cell
    }
    
}


//Mark : - ViewPresenter
protocol ViewPresenter: class
{
    func setDataSource(dataSource: [TableViewCellCustomModelProtocol])
}


protocol SuperUserCustomProtocol: class
{
    var labelTitle: String? {get set}
}


class SuperUserModel: SuperUserCustomProtocol,TableViewCellCustomModelProtocol
{
    var labelTitle: String?
    var dataSource: [String]?
    var cellType: QuestionType
    
    init(labelTitle: String,dataSource: [String],cellType: QuestionType)
    {
        self.labelTitle = labelTitle
        self.dataSource = dataSource
        self.cellType   = cellType
    }
}


// MARK : - Presenter
protocol SuperUserPresenterProtocol: class
{
    var viewPresenter: ViewPresenter? {get set}
    
    func getDataSource()
}

class SuperUserPresenter: SuperUserPresenterProtocol
{
    weak var viewPresenter: ViewPresenter?
//    private var connection = Services()
    
    func getDataSource()
    {
        var arrayOfDataSource = [TableViewCellCustomModelProtocol]()
        
        let enterprise =  PickerTableViewModelItem(callType: .picker, labelPickerText: "Empresa", dataSourceForPicker: ["Banco Azteca","Elektra","Grupo Dragon","Italika","tiendas Neto"])
        let udn = PickerTableViewModelItem(callType: .picker, labelPickerText: "UDN", dataSourceForPicker: ["UPAX","OTHER"])
        let position = PickerTableViewModelItem(callType: .picker, labelPickerText: "Puesto", dataSourceForPicker: ["Developer","Excel xD", ""])//SuperUserModel(labelTitle: "Puesto", dataSource: ["Developer","Excel xD", ""],cellType: .picker)
        let position1 = PickerTableViewModelItem(callType: .picker, labelPickerText: "Puesto", dataSourceForPicker: ["Developer","Excel xD", ""])//SuperUserModel(labelTitle: "Puesto", dataSource: ["Developer","Excel xD", ""],cellType: .picker)
        let position2 = PickerTableViewModelItem(callType: .picker, labelPickerText: "Puesto", dataSourceForPicker: ["Developer","Excel xD", ""])//SuperUserModel(labelTitle: "Puesto", dataSource: ["Developer","Excel xD", ""],cellType: .picker)
        let position3 = PickerTableViewModelItem(callType: .picker, labelPickerText: "Puesto", dataSourceForPicker: ["Developer","Excel xD", ""])//SuperUserModel(labelTitle: "Puesto", dataSource: ["Developer","Excel xD", ""],cellType: .picker)
        let position4 = PickerTableViewModelItem(callType: .picker, labelPickerText: "Puesto", dataSourceForPicker: ["Developer","Excel xD", ""])

        arrayOfDataSource.append(enterprise)
        arrayOfDataSource.append(udn)
        arrayOfDataSource.append(position)
        arrayOfDataSource.append(position1)
        arrayOfDataSource.append(position2)
        arrayOfDataSource.append(position3)
        arrayOfDataSource.append(position4)

        self.viewPresenter?.setDataSource(dataSource: arrayOfDataSource)
    }
}

