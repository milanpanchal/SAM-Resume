//
//  MPProjectsViewController.swift
//  MyResume
//
//  Created by MilanPanchal on 26/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPProjectsViewController: MPBaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet private var collectionView:UICollectionView!
    private var arrayProjectList = []
    private var selectedIndex = -1
//    MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Projects"
        self.collectionView.backgroundColor = UIColor.clearColor();

        if let path = NSBundle.mainBundle().pathForResource("Projects", ofType: "plist") {
            arrayProjectList = NSArray(contentsOfFile: path)!
        }
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

//    MARK: - CollectionView DataSource/Delegate methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return arrayProjectList.count;
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if selectedIndex != section {
            return 0
        }
        
        return (arrayProjectList[section]["projects"] as! NSArray).count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("projectCell", forIndexPath: indexPath) as! MPProjectCollectionViewCell
        let projects = (arrayProjectList[indexPath.section]["projects"] as! NSArray)
        cell.setupCellWithProjectDetails(projects[indexPath.row] as! Dictionary<String, String>)
        
        return cell
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let projects = (arrayProjectList[indexPath.section]["projects"] as! NSArray)
        let urlAsString = projects[indexPath.row]["url"] as! String
        let url = NSURL(string: urlAsString)
        
        if (url != nil) {
            UIApplication.sharedApplication().openURL(url!)
        }

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
        let width = CGRectGetWidth(collectionView.frame)/2-15
        return CGSizeMake(width,width)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
        
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            
            switch kind {
                
            case UICollectionElementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "projectHeader", forIndexPath: indexPath)
                //                headerView.backgroundColor = UIColor.blueColor();
                let lblCompanyName = headerView.viewWithTag(100) as! UILabel
                lblCompanyName.text = arrayProjectList[indexPath.section]["companyName"] as? String

                let lblDuration = headerView.viewWithTag(101) as! UILabel
                lblDuration.text = arrayProjectList[indexPath.section]["duration"] as? String

                print("selectedIndex = \(selectedIndex) & indexPath.section = \(indexPath.section)")
                let imgDropDownArrow = headerView.viewWithTag(102) as! UIImageView
                if selectedIndex == indexPath.section {
                    imgDropDownArrow.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                } else {
                    imgDropDownArrow.transform = CGAffineTransformIdentity
                }
                
                // Tap gesture
                let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "headerTapped:")
                singleTap.numberOfTapsRequired = 1
                singleTap.numberOfTouchesRequired = 1
                headerView.addGestureRecognizer(singleTap)
                headerView.userInteractionEnabled = true
                headerView.tag = indexPath.section
                return headerView
                
            default:
                assert(false, "Unexpected element kind")
            }
    }

//    MARK: - User defined methods
    func headerTapped(recognizer: UITapGestureRecognizer) {
        if(recognizer.state == UIGestureRecognizerState.Ended){
            
            if (selectedIndex == (recognizer.view?.tag)!) {
                selectedIndex = -1
            } else {
                selectedIndex = (recognizer.view?.tag)!
            }
            collectionView .reloadData()
        }
    }

}
