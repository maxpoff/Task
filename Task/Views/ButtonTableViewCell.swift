//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Maxwell Poffenbarger on 1/16/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
    func buttonCellTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?
    
    //MARK: Outlets
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Actions
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellTapped(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
    
}//End of class

