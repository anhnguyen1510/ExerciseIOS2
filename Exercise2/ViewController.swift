//
//  ViewController.swift
//  Exercise2
//
//  Created by Anhnguyen on 09/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var range: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func randomAction(_ sender: UIButton) {
        for i in 0...100 {
            range.append(i)
        }
        let input: Int? = Int(inputTextField.text ?? "")
        let result = range.randomElement()
        if input == result {
            resultLabel.text = "kết quả là: \(String(describing: result ?? 0)) chúc mừng"
        } else if (input ?? 0) < (result ?? 0) {
            resultLabel.text = "kết quả là: \(String(describing: result ?? 0)) bé quá"
        } else {
            resultLabel.text = "kết quả là: \(String(describing: result ?? 0)) lớn quá"
        }
    }
    
}

