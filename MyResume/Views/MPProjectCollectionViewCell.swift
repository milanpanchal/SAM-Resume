//
//  MPProjectCollectionViewCell.swift
//  MyResume
//
//  Created by MilanPanchal on 27/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPProjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var lblProjectName:UILabel!
    @IBOutlet private var imgViewProjectLogo:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        lblProjectName.textColor = UIColor.whiteColor()
        lblProjectName.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        lblProjectName.font = UIFont(name: MPConstants.FONT_HELVETICA_BOLD, size: 18.0)
        lblProjectName.textAlignment = .Center
    }
    
    func setupCellWithProjectDetails(projectDetails:Dictionary<String, String>) {
    
        lblProjectName?.text = projectDetails["title"]
        imgViewProjectLogo?.image = UIImage(named: projectDetails["icon"]!)
    }
}
