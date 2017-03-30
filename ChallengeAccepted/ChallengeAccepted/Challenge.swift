//
//  Challenge.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/27/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import Parse

class Challenge: PFObject, PFSubclassing {
    
    enum ChallengeStatus: String {
        case Completed
        case Failed
        case InProgress
    }
    
    @NSManaged var user: PFUser
    @NSManaged var title: String
    @NSManaged var descriptionText: String?
    @NSManaged var challenger: String?
    @NSManaged var win: String?
    @NSManaged var loose: String?
    @NSManaged var location: PFGeoPoint?
    @NSManaged var photo: PFFile?
    @NSManaged var status: String
    
    class func parseClassName() -> String {
        return "Challenge"
    }
}

