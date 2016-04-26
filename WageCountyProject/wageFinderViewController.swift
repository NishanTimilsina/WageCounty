//
//  wageFinderViewController.swift
//  WageCountyProject
//
//  Created by Nishan Timilsina on 4/22/16.
//  Copyright © 2016 Nishan Timilsina. All rights reserved.
//

import UIKit

class wageFinderViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var positionList: UIPickerView!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var areaTextField: UITextField!
    var pickerDataSource=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
          pickerDataSource = ["White", "Red", "Green", "Blue"];

        positionList.dataSource=self;
        positionList.delegate=self;
        self.title="Wage Finder"
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 238.0/255.0, green: 110.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        self.tabBarController!.tabBar.tintColor =  UIColor(red: 238.0/255.0, green: 110.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps.

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard1")
        view.addGestureRecognizer(tap)
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard1() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
