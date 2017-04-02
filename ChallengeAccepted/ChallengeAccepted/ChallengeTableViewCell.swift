//
//  ChallengeTableViewCell.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 4/1/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var challengeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  //  override func setSelected(_ selected: Bool, animated: Bool) {
  //      super.setSelected(selected, animated: animated)
  //      if (selected) {
  //          self.backgroundColor = .green
  //      }
  //      else {
  //          self.backgroundColor = .white
//     }

        // Configure the view for the selected state
//    }
    
}
