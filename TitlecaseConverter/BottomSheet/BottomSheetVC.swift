//
//  BottomSheetVC.swift
//  TitlecaseConverter
//
//  Created by Nimap on 08/02/24.
//

import UIKit

@available(iOS 15.0, *)
class BottomSheetVC: UIViewController {
    
    @IBOutlet weak var PledgeBtn: UIButton!
    @IBOutlet weak var TextStack: UIStackView!
    @IBOutlet weak var percentBtn: UIButton!
    @IBOutlet weak var MainImg: UIImageView!
    @IBOutlet weak var TVLabel: UILabel!
    @IBOutlet weak var CVLabel: UILabel!
    @IBOutlet weak var SDLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    
    var sheetData : Record?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.percentBtn.layer.cornerRadius = 30
        percentBtn.clipsToBounds = true
        self.PledgeBtn.layer.cornerRadius = 10
        PledgeBtn.clipsToBounds = true
        self.TextStack.layer.cornerRadius = 10
        TextStack.clipsToBounds = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Tapped)))
        
        let Image = URL(string: sheetData?.mainImageURL ?? "")
        self.MainImg.sd_setImage(with: Image)
        self.TitleLabel.text = sheetData?.title ?? ""
        self.SDLabel.text = sheetData?.shortDescription ?? ""
        self.TVLabel.text = "₹\(sheetData?.totalValue ?? 0)"
        self.CVLabel.text = "₹\(sheetData?.collectedValue ?? 0)"

        // Do any additional setup after loading the view.
    }
    @objc func Tapped() {
        self.dismiss(animated: true)
    }
}
