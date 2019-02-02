//
//  CustomMessageCell.swift
//  testingTinderSwipe
//
//  Created by Charlene Nicer on 2019-02-02.
//  Copyright © 2019 Nicky. All rights reserved.
//

import UIKit

class CustomMessageCell : UITableViewCell {
    
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var messageBody: UILabel!
    @IBOutlet var senderUsername: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

