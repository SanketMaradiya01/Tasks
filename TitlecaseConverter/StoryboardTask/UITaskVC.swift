//
//  UITaskVC.swift
//  TitlecaseConverter
//
//  Created by Nimap on 07/02/24.
//

import UIKit
import SDWebImage
import SDWebImageMapKit

struct TestData : Codable {
    let Status : Int?
    let Message : String?
    let data : DataClass?
}

struct DataClass : Codable {
    let TotalRecords: Int?
    let Records: [Record]?
}
struct Record : Codable{
    let Id: Int?
    let title, shortDescription: String?
    let collectedValue, totalValue: Int?
    let startDate, endDate: String?
    let mainImageURL: String?
}

protocol UITaskVCDelegate: NSObjectProtocol {
    func didRecievedData(models: [Record])
}

class UITaskVC: UIViewController {

    var delegate : UITaskVCDelegate?
    var Array = [Record]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UITaskTVC", bundle: .main), forCellReuseIdentifier: "UITaskTVC")
        API()
    }
    func API(){
        guard let url = URL(string: "https://testffc.nimapinfotech.com/testdata.json") else {return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request){ [self]data, response, error in
            if error != nil {
                print("Error in nill")
            }
            if let data = data{
                do{
                    let Data = try JSONDecoder().decode(TestData.self, from: data)
                    if Data.Status == 200 {
                        var models = Data.data
                        var model = models!.Records
                        self.Array = model!
                        self.delegate?.didRecievedData(models: self.Array)
                    }
                    print(Data)
                }catch{
                    print("Error in Do Block")
                }
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
        }.resume()
    }
}
@available(iOS 15.0, *)
extension UITaskVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITaskTVC", for: indexPath) as! UITaskTVC
        let Image = URL(string: Array[indexPath.row].mainImageURL ?? "")
        cell.MainImg.sd_setImage(with: Image)
        cell.TitleLabel.text = Array[indexPath.row].title ?? ""
        cell.SDLabel.text = Array[indexPath.row].shortDescription ?? ""
        cell.TVLabel.text = "₹\(Array[indexPath.row].totalValue ?? 0)"
        cell.CVLabel.text = "₹\(Array[indexPath.row].collectedValue ?? 0)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetVC
        vc.sheetData = Array[indexPath.row]
//        if let sheet = vc.sheetPresentationController{
//
//        }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
