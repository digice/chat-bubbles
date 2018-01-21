//
//  ViewController.swift
//  chat-bubbles
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2018 Digices. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - Properties

  var keyboard: Keyboard = Keyboard(frame: CGRect.zero)

  // MARK: - Outlets
  
  @IBOutlet weak var containerBottom: NSLayoutConstraint!

  // MARK: - Selectors
  
  /**
   * Called by NotificationCenter when the keyboard changes frame
   * - parameter: Notification
   */
  @objc func notificationHandler(_ notification: Notification) {
    if let userInfo = notification.userInfo {
      if let screenFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect {
        let viewFrame = self.view.convert(screenFrame, from: UIScreen.main.coordinateSpace)
        if viewFrame.minY != self.keyboard.frame.minY {
          self.keyboard.frame = viewFrame
          let offset: CGFloat = self.view.bounds.height - viewFrame.minY
          self.containerBottom.constant = offset
          UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
          } // ./animate
        } // ./new frame is different than stored frame
      } // ./frame in userInfo
    } // ./have userInfo
  } // ./notificationHandler
  
  // MARK: - UIViewController

  /**
   * Called when view is about to appear (all outlets loaded and populated)
   * - parameter: Bool
   */
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.notificationHandler(_:)), name: .UIKeyboardWillChangeFrame, object: nil)
  } // ./viewWillAppear
  
  /**
   * Called when view has disappeared, but not yet released
   * - parameter: Bool
   */
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NotificationCenter.default.removeObserver(self)
  } // ./viewDidDisappear

} // ./ViewController
