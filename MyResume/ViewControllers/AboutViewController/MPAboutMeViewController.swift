//
//  MPAboutMeViewController.swift
//  MyResume
//
//  Created by MilanPanchal on 26/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPAboutMeViewController: MPBaseViewController {
    
    @IBOutlet private var tblViewForAboutMe:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "About Me"

        self.tblViewForAboutMe.backgroundColor = UIColor.clearColor();
        self.tblViewForAboutMe.separatorStyle = .None
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

    //    MARK: - UITableViewDataSource/Delegate methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("aboutMeIntroCell", forIndexPath: indexPath) as! MPAboutMeTableViewCell
            cell.setupCellForUserInfo()
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("aboutMeDescCell", forIndexPath: indexPath) 
            cell.textLabel?.text = "Hi!\n\nI'm Milan Panchal. I’m always looking for something new to learn, for a new way to improve, for the next challenge. Software Development is my biggest passion.\n\nWhat I have done:\n\n• I got a B.Tech in Software Engineering\n• I have been working at PocketApp Pvt. Ltd. as a Software Engineer\n• I have started or contributed to open-source projects. Take a look at my GitHub(/milanpanchal) profile or ask more: I am always more than happy to talk about my projects!\n• My technical blog is at https://techfuzionwithsam.wordpress.com/\n\nIf you have something that you would like to discuss with me please drop me a  line at sam07it22@gmail.com"
            cell.backgroundColor = UIColor.clearColor()
            cell.textLabel?.textAlignment = .Left
            cell.textLabel?.font = UIFont(name: MPConstants.FONT_HELVETICA, size: 18)
            cell.textLabel?.numberOfLines = 0
            cell.selectionStyle = .None
            return cell
            
        }
        
    }

    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }*/
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 230.0 : UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
