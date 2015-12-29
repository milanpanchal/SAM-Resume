//
//  MPSkillsViewController.swift
//  MyResume
//
//  Created by MilanPanchal on 29/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPSkillsViewController: MPBaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet private var collectionViewForSkills:UICollectionView!
    private var arraySkills:[String] = []
    
    //    MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Skills"
        self.collectionViewForSkills.backgroundColor = UIColor.clearColor();
        
        arraySkills = ["iOS\nDevelopment","Objectve-C","Swift","Cocoa Touch","Mobile Applications","Web Services","REST","JSON","MySQL","Core Data", "Core Java", "Linux"]
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
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySkills.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("skillCell", forIndexPath: indexPath) as! MPSkillsCollectionViewCell
        cell.setupSkillCellWithSkillName(arraySkills[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width = CGRectGetWidth(collectionView.frame)/3-10
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
                let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "skillHeader", forIndexPath: indexPath)
                //                headerView.backgroundColor = UIColor.blueColor();
                let lblHeaderTitle = headerView.viewWithTag(100) as! UILabel
                lblHeaderTitle.text = "A concise list of some of the most valuable professional skills I possess."
                return headerView

            default:
                //4
                assert(false, "Unexpected element kind")
            }
    }

}
