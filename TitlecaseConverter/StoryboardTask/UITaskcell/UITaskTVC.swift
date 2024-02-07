//
//  UITaskTVC.swift
//  TitlecaseConverter
//
//  Created by Nimap on 07/02/24.
//

import UIKit

class UITaskTVC: UITableViewCell {

    @IBOutlet weak var PledgeBtn: UIButton!
    @IBOutlet weak var TextStack: UIStackView!
    @IBOutlet weak var percentBtn: UIButton!
    @IBOutlet weak var MainImg: UIImageView!
    @IBOutlet weak var TVLabel: UILabel!
    @IBOutlet weak var CVLabel: UILabel!
    @IBOutlet weak var SDLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.percentBtn.layer.cornerRadius = 30
        percentBtn.clipsToBounds = true
        self.PledgeBtn.layer.cornerRadius = 10
        PledgeBtn.clipsToBounds = true
        self.TextStack.layer.cornerRadius = 10
        TextStack.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
