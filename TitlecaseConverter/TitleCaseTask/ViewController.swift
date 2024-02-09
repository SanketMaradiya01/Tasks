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
        Main()
        
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

func Addition(first : Double , second : Double) -> Double{
    return first + second
}
func Subtraction(first : Double , second : Double) -> Double{
    return first - second
}
func Multiplication(first : Double , second : Double) -> Double{
    return first * second
}
func Division(first: Double, second: Double) -> Double {
    if second != 0 {
        return first / second
    } else {
        print("Error: cannot divide by 0")
        return 0.0
    }
}
func Main()
{
    print("Please Choose ")
    print(" press 1 for Addition ")
    print(" press 2 for Subtraction ")
    print(" press 3 for Multiplication ")
    print(" press 4 for Division ")
    
    if let choice = readLine(), let Operations = Int(choice)
    {
    print("Enter First Number")
    if let input1 = readLine(), let first = Double(input1)
    {
    print("Enter Second Number")
    if let input2 = readLine(), let second = Double(input2)
    {
    var result : Double = 0.0
    switch Operations {
        case 1:
         result = Addition(first: first, second: second)
        case 2:
         result = Subtraction(first: first, second: second)
        case 3:
         result = Multiplication(first: first, second: second)
        case 4:
         result = Division(first: first, second: second)
        default:
            print("invalid operation")
            return
        }
    print("result: \(result)")
    }
    else{
            print("Invalid Second Number")
        }
    }else{
            print("Invalid First Number")
        }
    }else{
            print("Invalid Option")
        }
}

