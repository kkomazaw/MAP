//
//  ViewController.swift
//  MAP
//
//  Created by Matsui Keiji on 2017/11/27.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var SBPPicker:UIPickerView!
    @IBOutlet weak var DBPPicker:UIPickerView!
    @IBOutlet weak var PPLabel:UILabel!
    @IBOutlet weak var MAPLabel:UILabel!

    var vSBP = 130.0
    var vDBP = 85.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   @objc func numberOfComponentsInPickerView(_ pickerView: UIPickerView!) -> Int {
        return 1
    }
    
   @objc func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return 201
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        var c: String?
        if pickerView.tag == 0{
             c = "\(row + 50)"
        }
        if pickerView.tag == 1{
             c = "\(row)"
        }
        return c
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            vSBP = Double(row + 50)
        }
        if pickerView.tag == 1{
            vDBP = Double(row)
        }
        if vDBP >= vSBP{
            PPLabel.text = "pulse pressure: ___mmHg"
            MAPLabel.text = "MAP: ___mmHg"
        }
        else{
            let vPP = Int(vSBP - vDBP)
            let vMAP = Int(round(vSBP / 3.0 + vDBP * 2.0 / 3.0))
            PPLabel.text = "pulse pressure: " + "\(vPP)" + "mmHg"
            MAPLabel.text = "MAP: " + "\(vMAP)" + "mmHg"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SBPPicker.selectRow(80, inComponent: 0, animated: true)
        DBPPicker.selectRow(85, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

