//
//  ProgrammaticUIVC.swift
//  TitlecaseConverter
//
//  Created by Nimap on 08/02/24.
//

import UIKit

class ProgrammaticUIVC: UIViewController, UITaskVCDelegate {

    let data = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    var TopView : UIView?
    var tableView: UITableView!
    var titleLabel : UILabel?

    var TotalProgData = [Record]()
    
    var firstVC   = UITaskVC()

        // MARK: - View Lifecycle

        override func viewDidLoad() {
            super.viewDidLoad()
            firstVC.delegate = self
            firstVC.API()
            configureUI()
            print("TotalProgData\(TotalProgData)")
            
        }

        // MARK: - UI Configuration

        private func configureUI() {
            view.backgroundColor = .white


            TopView = UIView()
            TopView?.backgroundColor = .black
            view.addSubview(TopView!)

            
            tableView = UITableView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.backgroundColor = .black
            view.addSubview(tableView)
            // Add UI components to the view
            
            
            


//             Configure layout constraints
            titleLabel = UILabel()
            titleLabel?.textColor = .white
            titleLabel?.text = "Recent List"
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
            
            titleLabel?.translatesAutoresizingMaskIntoConstraints = false
            TopView!.addSubview(titleLabel!)
            NSLayoutConstraint.activate([
                titleLabel!.centerXAnchor.constraint(equalTo: TopView!.centerXAnchor),
                titleLabel!.centerYAnchor.constraint(equalTo: TopView!.centerYAnchor)
            ])

            TopView?.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                TopView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                TopView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                TopView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

                TopView!.heightAnchor.constraint(equalToConstant: 60.0)
            ])

            tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: self.TopView!.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])
            
            
        }

        // MARK: - Action Methods

        @objc private func loginButtonTapped() {
            // Add your login logic here
            print("Login button tapped")
        }
    
    func didRecievedData(models: [Record]) {
        TotalProgData = models
    }
    
}
extension ProgrammaticUIVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of cells you want in the table view
        return TotalProgData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let Image = URL(string: TotalProgData[indexPath.row].mainImageURL ?? "")
        cell.Image!.sd_setImage(with: Image)
        cell.FundNumL!.text = "₹\(TotalProgData[indexPath.row].collectedValue ?? 0)"
        cell.GoalNumL!.text = "₹\(TotalProgData[indexPath.row].totalValue ?? 0)"
        cell.TitleLabel!.text = TotalProgData[indexPath.row].title ?? ""
        cell.DescriptionLabel!.text = TotalProgData[indexPath.row].shortDescription ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
