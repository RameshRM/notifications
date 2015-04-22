//
//  DetailViewController.swift
//  PushChat
//
//  Created by Mahadevan, Ramesh on 4/20/15.
//  Copyright (c) 2015 GoliaMania. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var notificationTitle: UILabel!
    
    @IBOutlet weak var notificationAction: UITextView!
    
    var dataContext:Notification?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(dataContext != nil){

            self.notificationTitle.text = dataContext?.message as! String;
            if(dataContext?.notificationDtl != nil){
                self.notificationAction.text = dataContext?.notificationDtl?.action as! String;
                self.notificationAction.text = dataContext?.notificationDtl?.action as! String;
                self.notificationTitle.textColor = severityStatus(dataContext?.notificationDtl?.severity as! String);
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    func severityStatus(severity:String)->UIColor{
        if(severity == "UNDER WATCH"){
            
        }
        switch (severity){
        case "UNDER WATCH":
            return UIColor(red: 0, green: 0, blue: 255, alpha: 0.6);
        case "NORMAL":
            return UIColor.greenColor();
        case "HIGH":
            return UIColor.orangeColor();
        case "ELEVATED":
            return UIColor.brownColor();
        case "SEVERE":
            return UIColor.redColor();
        default:
            return UIColor.blackColor();
        }
        
    }
    
}
