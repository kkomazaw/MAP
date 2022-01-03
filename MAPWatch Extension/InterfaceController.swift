//
//  InterfaceController.swift
//  MAPWatch Extension
//
//  Created by Matsui Keiji on 2017/11/29.
//  Copyright © 2017年 Matsui Keiji. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var SBPPicker: WKInterfacePicker!
    @IBOutlet weak var DBPPicker: WKInterfacePicker!
    @IBOutlet weak var PPLabel: WKInterfaceLabel!
    @IBOutlet weak var MAPLabel: WKInterfaceLabel!
    
    var vSBP = 130.0
    var vDBP = 85.0

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var SBPpickerItems:[WKPickerItem] = []
        var DBPpickerItems:[WKPickerItem] = []
        for i in 50...250{
            let item = WKPickerItem()
            item.title = "\(i)"
            SBPpickerItems.append(item)
        }
        self.SBPPicker.setItems(SBPpickerItems)
        SBPPicker.setSelectedItemIndex(80)
        for i in 0...200{
            let item = WKPickerItem()
            item.title = "\(i)"
            DBPpickerItems.append(item)
        }
        self.DBPPicker.setItems(DBPpickerItems)
        DBPPicker.setSelectedItemIndex(85)
        // Configure interface objects here.
    }
    
    func myCalc(){
        if vDBP >= vSBP{
            PPLabel.setText("PP: ___mmHg")
            MAPLabel.setText("MAP: ___mmHg")
        }
        else{
            let vPP = Int(vSBP - vDBP)
            let vMAP = Int(round(vSBP / 3.0 + vDBP * 2.0 / 3.0))
            PPLabel.setText("PP: " + "\(vPP)" + "mmHg")
            MAPLabel.setText("MAP: " + "\(vMAP)" + "mmHg")
        }
    }
    
    @IBAction func SBPpickerChanged(_ value: Int){
        vSBP = Double(value + 50)
        myCalc()
    }
    
    @IBAction func DBPpickerChanged(_ value: Int){
        vDBP = Double(value)
        myCalc()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
