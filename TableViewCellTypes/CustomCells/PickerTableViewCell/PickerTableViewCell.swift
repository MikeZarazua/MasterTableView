//
//  PickerTableViewCell.swift
//  TableViewCellTypes
//
//  Created by Mike Zarazua on 10/15/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var labelTextfield: UILabel!
    @IBOutlet weak var textFieldPickerview: UITextField!
    //MARK : - Variables
    private var model: PickerTableViewModelItem?
    {
        didSet{
            guard let model = model else {
                return
            }
            configurePicker()
            self.labelTextfield.text = model.labelPickerText
        }
    }
    private var pickerView: UIPickerView?
    private var dataSource: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configurePicker()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//MARK: - CellCustomModelProtocol methods
extension PickerTableViewCell: CellCustomModelProtocol
{
    func setModel(model: TableViewCellCustomModelProtocol) {
        self.model = model as? PickerTableViewModelItem
        self.dataSource = self.model?.dataSourceForPicker
    }
}


//MARK: - private methods
extension PickerTableViewCell
{
    private func configurePicker()
    {
        pickerView = UIPickerView()
        pickerView?.delegate = self
        pickerView?.dataSource = self
        self.textFieldPickerview.inputView = pickerView
    }
}

//MARK: - Picker delegate
extension PickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let dataSourceCount = dataSource?.count else {return}
        guard dataSourceCount > 0 else {
            print("dataSource?.count is not > 0")
            return
        }
        textFieldPickerview.text = dataSource?[row]
    }
}
