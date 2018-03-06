//
//  Message.swift
//  walnutcreek
//
//  Created by Lewis Black on 03/03/2018.
//  Copyright © 2018 Lewis Black. All rights reserved.
//

import UIKit

class Message {
    
    private (set) public var userName:String
    private (set) public var message:String
    private (set) public var userID:String
    
    init(userName:String, message:String, userID:String) {
        self.message = message
        self.userID = userID
        self.userName = userName
    }
    
   
}

extension UIView {
    
    public func addCornerOf8() {
        addCornerOf(radius: 8)
    }
    
    public func addCornerOf(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
}


class MessageCell:UITableViewCell {
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var messageView: UIView!{
        didSet{
            messageView.addCornerOf(radius: 10)
        }
        
    }
    @IBOutlet weak var userName: UILabel!
    
}

class UserMessageCell:UITableViewCell {
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messageView: UIView!{
        didSet{
            messageView.addCornerOf(radius: 10)
        }
    }
}
