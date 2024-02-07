//
//  ViewController.swift
//  TitlecaseConverter
//
//  Created by Nimap on 07/02/24.
//

import UIKit

class ViewController: UIViewController {

    var Array = ["hello", "world", "table", "football", "pipe", "code"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var UpperBtn: UIButton!
    @IBOutlet weak var titleBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TitlecaseTVC", bundle: .main), forCellReuseIdentifier: "TitlecaseTVC")
        self.UpperBtn.layer.cornerRadius = 10
        self.titleBtn.layer.cornerRadius = 10
        
    }
    func ConvertToTitlecase() {
        Array.forEach{ArrayString in
            if let index = Array.firstIndex(of: ArrayString){
                Array[index] = ArrayString.capitalized
            }
        }
//            Array = Array.map { $0.capitalized }
            tableView.reloadData()
        }
    func ConvertToUppercase(){
        Array.forEach{
            ArrayString in
            if let index = Array.firstIndex(of: ArrayString){
                Array[index] = ArrayString.capitalized
            }
        }
//        Array.sort{$0 < $1}
//        Array = Array.map { $0.uppercased() }
        tableView.reloadData()
    }
    @IBAction func TitleBtn(_ sender: Any) {
        ConvertToTitlecase()
    }
    @IBAction func UpperBtn(_ sender: Any) {
        ConvertToUppercase()
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitlecaseTVC", for: indexPath) as! TitlecaseTVC
        cell.TitleLabel.text = Array[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

