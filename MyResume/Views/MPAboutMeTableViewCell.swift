//
//  MPAboutMeTableViewCell.swift
//  MyResume
//
//  Created by MilanPanchal on 26/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPAboutMeTableViewCell: UITableViewCell {

    @IBOutlet private var lblName:UILabel!
    @IBOutlet private var lblDesignation:UILabel!
    @IBOutlet private var imgViewProfilePic:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clearColor()

        imgViewProfilePic?.layer.cornerRadius = CGRectGetHeight(imgViewProfilePic.frame)/2.0
        imgViewProfilePic.layer.borderWidth = 2.0
        imgViewProfilePic.layer.borderColor = UIColor.darkGrayColor().CGColor
        imgViewProfilePic.layer.masksToBounds = true
        imgViewProfilePic.clipsToBounds = true
            
        lblName.textColor = UIColor.blackColor()
        lblDesignation.textColor = UIColor.blackColor()
        
        lblName.font = UIFont(name: MPConstants.FONT_HELVETICA_BOLD, size: 20.0)
        lblDesignation.font = UIFont(name: MPConstants.FONT_HELVETICA, size: 16.0)
        
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func setupCellForUserInfo(params:Dictionary<String, String>) {
        
    }
    
    func setupCellForUserInfo() {
        imgViewProfilePic.image = UIImage(named: "profile_pic")
        lblName.text = "Milan Panchal"
        lblDesignation.text = "Software Engineer @ PocketApp"
    }
    
    
}
