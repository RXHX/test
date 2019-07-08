//
//  Model.swift
//  Tail2
//
//  Created by Rohan on 04/06/19.
//  Copyright © 2019 Infogain. All rights reserved.
//

import UIKit

class Balloon: NSObject {

    
    // Class Members
    let  X_coordinate : CGFloat = 50 ;
    let  Y_coordinate : CGFloat = 100 ;
    let  width : CGFloat = 150 ;
    let  height : CGFloat = 200;
    let message1 : String = """
    New Members are Invited

    This is a 'general' channel.
    All members of this workspace can
    see this channel.

    Create channels by subject or roles
    and start a conversation.

    """
    let message2 = "You can see and invite more members";
    let triangle_height : CGFloat = -8 ;
    let triangle_starting_x_point : CGFloat = 50;  // enter point x less than equal to width - 20

    
    
    // Global Reference to All Classes
    static let sharedInstance = Balloon();
    
    
    
    

   
    
    

    
}
