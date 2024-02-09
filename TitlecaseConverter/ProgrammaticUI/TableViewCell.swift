//
//  TableViewCell.swift
//  TitlecaseConverter
//
//  Created by Nimap on 09/02/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var MainView : UIView?
    var StackView : UIStackView?
    var Image : UIImageView?
    var FundStack : UIStackView?
    var GoalStack : UIStackView?
    var EndStack : UIStackView?
    var PledgeBtn : UIButton?
    var FundNumL : UILabel?
    var FundL : UILabel?
    var GoalNumL : UILabel?
    var GoalL : UILabel?
    var EndNumL : UILabel?
    var EndL : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.sendSubviewToBack(contentView)
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        baseCellView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func baseCellView() {
        
        contentView.backgroundColor = UIColor(named: "CellBG")
        
        
        MainView = UIView()
        MainView?.translatesAutoresizingMaskIntoConstraints = false
        MainView?.backgroundColor = UIColor(named: "CellBG")
        contentView.addSubview(MainView!)
        NSLayoutConstraint.activate([
            MainView!.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4.0),
            MainView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4.0),
            MainView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4.0),
            MainView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4.0),
            MainView!.heightAnchor.constraint(equalToConstant: 300.0)
        ])
    
        Image = UIImageView()
        Image!.translatesAutoresizingMaskIntoConstraints = false
        Image!.backgroundColor = .white
        Image!.image = UIImage(systemName: "photo.artframe")
        MainView!.addSubview(Image!)
        NSLayoutConstraint.activate([
            Image!.topAnchor.constraint(equalTo: MainView!.topAnchor),
            Image!.leadingAnchor.constraint(equalTo: MainView!.leadingAnchor, constant: 4.0),
            Image!.trailingAnchor.constraint(equalTo: MainView!.trailingAnchor, constant: -4.0),
            Image!.heightAnchor.constraint(equalToConstant: 180.0)
        ])
        
        StackView = UIStackView()
        StackView?.translatesAutoresizingMaskIntoConstraints = false
        StackView?.axis = .horizontal
        StackView!.alignment = .fill
        StackView!.distribution = .fillEqually
        StackView!.spacing = 10
        StackView?.backgroundColor = .clear
        MainView?.addSubview(StackView!)
        NSLayoutConstraint.activate([
            StackView!.topAnchor.constraint(equalTo: Image!.bottomAnchor, constant: 30.0),
            StackView!.leadingAnchor.constraint(equalTo: MainView!.leadingAnchor, constant: 4.0),
            StackView!.trailingAnchor.constraint(equalTo: MainView!.trailingAnchor, constant: -4.0),
            StackView!.heightAnchor.constraint(equalToConstant: 70.0)
        ])
        
        FundStack = UIStackView()
        FundStack?.translatesAutoresizingMaskIntoConstraints = false
        FundStack?.axis = .vertical
        StackView!.addArrangedSubview(FundStack!)
        NSLayoutConstraint.activate([
//            FundStack!.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        GoalStack = UIStackView()
        GoalStack?.translatesAutoresizingMaskIntoConstraints = false
        GoalStack?.axis = .vertical
        StackView!.addArrangedSubview(GoalStack!)
        NSLayoutConstraint.activate([
//            GoalStack!.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        EndStack = UIStackView()
        EndStack?.translatesAutoresizingMaskIntoConstraints = false
        EndStack?.axis = .vertical
        StackView!.addArrangedSubview(EndStack!)
        NSLayoutConstraint.activate([
//            EndStack!.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        FundNumL = UILabel()
        FundNumL?.translatesAutoresizingMaskIntoConstraints = false
        FundNumL!.text = "500"
        FundStack!.addArrangedSubview(FundNumL!)
//        NSLayoutConstraint.activate([
//            FundNumL!.heightAnchor.constraint(equalToConstant: 25)
//        ])
        
        FundL = UILabel()
        FundL?.translatesAutoresizingMaskIntoConstraints = false
        FundL!.text = "FUNDED"
        FundStack!.addArrangedSubview(FundL!)
//        NSLayoutConstraint.activate([
//            FundL!.heightAnchor.constraint(equalToConstant: 25)
//        ])
        
        EndNumL = UILabel()
        EndNumL?.translatesAutoresizingMaskIntoConstraints = false
        EndNumL!.text = "10"
        EndStack!.addArrangedSubview(EndNumL!)
//        NSLayoutConstraint.activate([
//            EndNumL!.heightAnchor.constraint(equalToConstant: 25)
//        ])
        
        EndL = UILabel()
        EndL?.translatesAutoresizingMaskIntoConstraints = false
        EndL!.text = "ENDED"
        EndStack!.addArrangedSubview(EndL!)
//        NSLayoutConstraint.activate([
//            EndL!.heightAnchor.constraint(equalToConstant: 25)
//        ])
        
        GoalNumL = UILabel()
        GoalNumL?.translatesAutoresizingMaskIntoConstraints = false
        GoalNumL!.text = "5000"
        GoalStack!.addArrangedSubview(GoalNumL!)
//        NSLayoutConstraint.activate([
//            FundNumL!.heightAnchor.constraint(equalToConstant: 25)
//        ])
        
        GoalL = UILabel()
        GoalL?.translatesAutoresizingMaskIntoConstraints = false
        GoalL!.text = "GOALS"
        GoalStack!.addArrangedSubview(GoalL!)
//        NSLayoutConstraint.activate([
//            FundL!.heightAnchor.constraint(equalToConstant: 25)
//        ])
        
        var buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = .clear
        StackView!.addArrangedSubview(buttonView)
        
        PledgeBtn = UIButton()
        PledgeBtn?.translatesAutoresizingMaskIntoConstraints = false
        PledgeBtn?.setTitle("PLEDGE", for: .normal)
        PledgeBtn?.backgroundColor = .white
        PledgeBtn?.setTitleColor(UIColor(named: "AccentColor"),for: .normal)
        PledgeBtn?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        PledgeBtn?.layer.cornerRadius = 10
        PledgeBtn?.clipsToBounds = true
        buttonView.addSubview(PledgeBtn!)
        NSLayoutConstraint.activate([
            PledgeBtn!.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            PledgeBtn!.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            PledgeBtn!.heightAnchor.constraint(equalToConstant: 30),
            PledgeBtn!.widthAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
