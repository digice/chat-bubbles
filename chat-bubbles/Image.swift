//
//  Image.swift
//  chat-bubbles
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

class Image {
    
  static let bubbleLeft: UIImage = UIImage(named: "bubble_left")!.resizableImage(withCapInsets: UIEdgeInsetsMake(17, 21, 17, 21), resizingMode: .stretch).withRenderingMode(.alwaysTemplate)
  
  static let bubbleRight: UIImage = UIImage(named: "bubble_right")!.resizableImage(withCapInsets: UIEdgeInsetsMake(17, 21, 17, 21), resizingMode: .stretch).withRenderingMode(.alwaysTemplate)
  
  static let send: UIImage = UIImage(named: "send")!
  
}
