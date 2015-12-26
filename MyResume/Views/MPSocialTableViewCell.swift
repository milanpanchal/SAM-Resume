//
//  MPSocialTableViewCell.swift
//  MyResume
//
//  Created by MilanPanchal on 26/12/15.
//  Copyright © 2015 Pantech. All rights reserved.
//

import UIKit

class MPSocialTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.textLabel?.textColor = UIColor(red: 36/255.0, green: 36/255.0, blue: 36/255.0, alpha: 1.0)
        self.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 16.0)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupSocialCellWithParams(params:NSDictionary) {
    
        self.textLabel?.text = params["title"] as? String
        self.imageView?.image = UIImage(named: (params["icon"] as? String)!)
    }
}
