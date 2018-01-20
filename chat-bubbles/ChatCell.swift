//
//  ChatCell.swift
//  chat-bubbles
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
  
  @IBOutlet weak var bubbleView: UIImageView!
  
  @IBOutlet weak var bubbleTrailing: NSLayoutConstraint!
  
  @IBOutlet weak var bubbleLeading: NSLayoutConstraint!
  
  @IBOutlet weak var messageLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    // prevent default behavior
  }
  
  func configureCell(sent: Bool, string: String) {
  
    // set the text of the bubble
    self.messageLabel?.text = string
    
    if sent == true {
    
      // set the background image
      self.bubbleView?.image = Image.bubbleLeft
      
      // set the bubble color (blue)
      self.bubbleView?.tintColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
      
      // set the text color (black)
      self.messageLabel?.textColor = .black
      
      // align the bubble right
      self.bubbleLeading.constant = 100
      self.bubbleTrailing.constant = 10
      
    } else {
    
      // set the background image
      self.bubbleView?.image = Image.bubbleRight

      // set the bubble color (light gray)
      self.bubbleView?.tintColor = UIColor(red: 15/255, green: 121/255, blue: 252/255, alpha: 1)
      
      // set the text color (white)
      self.messageLabel?.textColor = .white
      
      // align the bubble left
      self.bubbleLeading.constant = 10
      self.bubbleTrailing.constant = 100
      
    }
    
  } // ./configureCell
  
}
