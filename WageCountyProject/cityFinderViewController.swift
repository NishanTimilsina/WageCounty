//
//  cityFinderViewController.swift
//  WageCountyProject
//
//  Created by Nishan Timilsina on 4/22/16.
//  Copyright © 2016 Nishan Timilsina. All rights reserved.
//

import UIKit

class cityFinderViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    override func viewWillAppear(animated: Bool) {
        resultView.hidden=true
        cityTextField.text=""


    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.title="City Finder"
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 238.0/255.0, green: 110.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        self.tabBarController!.tabBar.tintColor =  UIColor(red: 238.0/255.0, green: 110.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard2")
        view.addGestureRecognizer(tap)
        resultView.hidden=true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard2() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func searchBtnClicked(sender: AnyObject) {
        var text=cityTextField.text
        resultView.hidden=false
        resultView.backgroundColor=UIColor(red: 199.0/255.0, green: 230.0/255.0, blue: 202.0/255.0,alpha:1.0)
        cityTextField.text=""
        resultLabel.text="Fairfield,IA"

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
