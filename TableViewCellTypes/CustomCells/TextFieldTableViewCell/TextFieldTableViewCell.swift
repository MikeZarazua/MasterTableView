//
//  TextFieldTableViewCell.swift
//  TableViewCellTypes
//
//  Created by Mike Zarazua on 10/15/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var labelGeneric: UILabel!
    @IBOutlet weak var textFieldGeneric: UITextField!
    
    //MARK: - variables
    var model: TextFieldModelItem?
    {
        didSet
        {
            self.configureCurrentmodel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//MARK: - Private methods
extension TextFieldTableViewCell
{
    private func configureCurrentmodel()
    {
        //Make sure that the objec model is not nil
        guard let model = self.model else {
            print("Couldn't set  let model = self.model")
            return
        }
        self.labelGeneric.text = model.labeltext
        if !model.textFieldResponse.isEmpty
        {
            self.textFieldGeneric.text = model.textFieldResponse
        }
    }
}

//MARK: - CellCustomModelProtocol methds
extension TextFieldTableViewCell: CellCustomModelProtocol
{
    func setModel(model: TableViewCellCustomModelProtocol) {
        self.model = model as? TextFieldModelItem
    }
}



