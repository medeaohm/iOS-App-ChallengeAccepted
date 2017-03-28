//
//  Challenge.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/27/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class Challenge: PFObject, PFSubclassing {
    
    @NSManaged var title: String
    @NSManaged var location: PFGeoPoint?
    @NSManaged var photo: PFFile?
    @NSManaged var expirationDate: Date?
    @NSManaged var challenger: String?
    @NSManaged var premium: String?
    
    
    class func parseClassName() -> String {
        return "Challenge"
    }
}

