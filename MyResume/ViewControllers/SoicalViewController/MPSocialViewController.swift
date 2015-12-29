//
//  MPSocialViewController.swift
//  MyResume
//
//  Created by MilanPanchal on 26/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPSocialViewController: MPBaseViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet private var tblViewForSocial:UITableView!
//    private var arraySocialList! :Dictionary<String:String> = ["icon":"GitHub"]
    
    var arraySocial:[Dictionary<String, String>] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Social Links"
        self.tblViewForSocial.backgroundColor = UIColor.clearColor();
        
        arraySocial = [
            ["icon":"GitHub", "title":"GitHub (/milanpanchal)", "url":"https://github.com/milanpanchal/"],
            ["icon":"StackOverflow", "title":"Stack Overflow", "url":"https://stackoverflow.com/users/1748956/milanpanchal"],
            ["icon":"LinkedIn", "title":"LinkedIn (/in/milanpanchal)", "url":"https://in.linkedin.com/in/milanpanchal/"],
            ["icon":"Twitter", "title":"Twitter (@milan_panchal24)", "url":"https://twitter.com/milan_panchal24"],
            ["icon":"Blog", "title":"Blog", "url":"https://mypoemswithsam.wordpress.com/"],
        ]
        
        
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
        return arraySocial.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("socialCell", forIndexPath: indexPath) as! MPSocialTableViewCell
        cell.setupSocialCellWithParams(arraySocial[indexPath.row])
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let urlAsString = arraySocial[indexPath.row]["url"]!
        let url = NSURL(string: urlAsString)

        if (url != nil) {
            UIApplication.sharedApplication().openURL(url!)
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

}
