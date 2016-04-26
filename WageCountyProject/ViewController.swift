//
//  ViewController.swift
//  WageCountyProject
//
//  Created by Nishan Timilsina on 4/22/16.
//  Copyright © 2016 Nishan Timilsina. All rights reserved.
////
import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var addressTextField: UITextField!
   
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var blsCodeLabel: UILabel!
    var pageMenu : CAPSPageMenu?

    
    override func viewWillAppear(animated: Bool) {
        resultView.hidden=true
        addressTextField.text=""
        
        
    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        
        //display menu bar
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 238.0/255.0, green: 110.0/255.0, blue: 115.0/255.0, alpha: 1.0)
       // self.tabBarController!.tabBar.tintColor =  UIColor(red: 238.0/255.0, green: 110.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        resultView.hidden=true
        //loadMenu()
        // Do any additional setup after loading the view, typically from a nib.
    }
        //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func searchBtnClicked(sender: AnyObject) {
        resultView.hidden=false
        
        let url:NSURL = NSURL(string: "www.")!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let paramString = "data=Hello"
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(dataString)
            
        }
        
        task.resume()    }
  
}

