//
//  CameraTableViewCell.swift
//  TableViewCellTypes
//
//  Created by Mike Zarazua on 10/15/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

class CameraTableViewCell: UITableViewCell
{

    ///IBOutlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet var imagePrincipal: UIImageView!
    ///Variables
    private var model: CameraTableViewModelItem?
    {
        didSet{
            configureSubtypeModel(model: model)
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

//MARK: - private methods
extension CameraTableViewCell
{
    private func configureSubtypeModel(model: CameraTableViewModelItem?)
    {
        guard let model = model else {return}
        self.labelTitle.text = model.title
        switch model.questionModelSubtype
        {
            case .multimediaImage:
                self.imagePrincipal.image = UIImage(named: "camera", in: Bundle.main, compatibleWith: nil)
            case .multimediaVideo:
                self.imagePrincipal.image = UIImage(named: "video", in: Bundle.main, compatibleWith: nil)

            case .multimediaAudio:
                self.imagePrincipal.image = UIImage(named: "video", in: Bundle.main, compatibleWith: nil)

            case .multimediaAttahment:
                self.imagePrincipal.image = UIImage(named: "circleMultimedia", in: Bundle.main, compatibleWith: nil)
        }
    }
}

//MARK: CellCustomModelProtocol methods
extension CameraTableViewCell: CellCustomModelProtocol
{
    func setModel(model: TableViewCellCustomModelProtocol) {
        guard let model = model as? CameraTableViewModelItem else{
            print("couldn't set let model = model as? CameraTableViewModelItem")
            return
        }
        self.model = model
    }
}


enum QuestionModelSubtype
{
    case multimediaImage
    case multimediaVideo
    case multimediaAudio
    case multimediaAttahment
}
