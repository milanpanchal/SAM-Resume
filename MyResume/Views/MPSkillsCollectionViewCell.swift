//
//  MPSkillsCollectionViewCell.swift
//  MyResume
//
//  Created by MilanPanchal on 29/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPSkillsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var lblSkillName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblSkillName.textColor = UIColor.blackColor()
        lblSkillName.backgroundColor = UIColor.whiteColor()
        lblSkillName.font = UIFont(name: MPConstants.FONT_HELVETICA_BOLD, size: 18.0)
        lblSkillName.minimumScaleFactor = 0.5
        lblSkillName.textAlignment = .Center
        lblSkillName.layer.cornerRadius = 10.0
        lblSkillName.layer.masksToBounds = true
        lblSkillName.clipsToBounds = true
        lblSkillName.layer.borderWidth = 2.0
        lblSkillName.layer.borderColor = UIColor.grayColor().CGColor
        lblSkillName.numberOfLines = 0
    }
    
    func setupSkillCellWithSkillName(skillName:String) {
        
        lblSkillName?.text = skillName
    }
}
