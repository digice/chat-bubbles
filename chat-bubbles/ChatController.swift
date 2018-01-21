//
//  ChatController.swift
//  chat-bubbles
//
//  Created by Roderic Linguri on 1/20/18.
//  Copyright © 2018 Digices. All rights reserved.
//

import UIKit

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
  // MARK: - Properties
  
  var objects: [Message] = [
    Message(time: Date(), string: "Hello, How are you?", sent: false),
    Message(time: Date(), string: "I'm fine.", sent: true),
    Message(time: Date(), string: "What did you do today?", sent: false),
    Message(time: Date(), string: "I went to the Grocery store and bought some potato chips", sent: true),
    Message(time: Date(), string: "Did you buy me some too? 🥔", sent: false)
  ]
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var entryView: UIView!
  
  @IBOutlet weak var borderView: UIView!
  
  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var sendButton: UIButton!
  
  // MARK: - Actions
  
  /**
   * Send Action
   * - parameter: UIButton
   */
  @IBAction func send(_ sender: UIButton) {
    if let text = self.textField.text {
      if text.count > 0 {
        let message = Message(time: Date(), string: text, sent: true)
        self.objects.append(message)
        self.textField.text = ""
        self.tableView.reloadData()
      }
    }
  } // ./send
  
  // MARK: - UIViewController
  
  /**
   * Called when outlets have been loaded
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // configure tableView
    self.tableView.separatorStyle = .none
    self.tableView.estimatedRowHeight = 44
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10); // top, left, bottom, right
    
    // configure borderView
    self.borderView.layer.borderColor = UIColor.lightGray.cgColor
    self.borderView.layer.borderWidth = 1
    self.borderView.layer.cornerRadius = 18
    
    // configure sendButton
    self.sendButton.isEnabled = false
    self.sendButton.tintColor = .lightGray
    
  } // ./viewDidLoad
  
  // MARK: - UITableViewDataSource
  
  /**
   * Number Of Rows In Section
   * - parameter: UITableView
   * - parameter: Int (section index)
   * - return:    Int
   */
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.objects.count
  } // ./numberOfRowsInSection
  
  /**
   * Cell For Row At IndexPath
   * - parameter: UITableView
   * - parameter: IndexPath
   * - return:    UITableViewCell
   */
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatCell
    let message = self.objects[indexPath.row]
    cell.configureCell(sent: message.sent, string: message.string)
    return cell
  } // ./cellForRowAtIndexPath
  
  // MARK: - UITextFieldDelegate
  
  /**
   * Text Field Should Return
   * Called when user touches the return button
   * - parameter: UITextField
   * - return:    Bool
   */
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.send(self.sendButton)
    self.view.endEditing(true)
    return true
  } // ./textFieldShouldReturn
  
  /**
   * Text Field Did Begin Editing
   * - parameter: UITextField
   */
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.sendButton.isEnabled = true
    self.sendButton.tintColor = UIColor(red: 15/255, green: 121/255, blue: 252/255, alpha: 1)
    let offset = CGPoint(x: 0, y: self.tableView.bounds.size.height - self.tableView.contentSize.height)
    self.tableView.setContentOffset(offset, animated: true)
  } // ./textFieldDidBeginEditing
  
  /**
   * Text Field Did End Editing
   * - parameter: UITextField
   */
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.sendButton.isEnabled = false
    self.sendButton.tintColor = .lightGray
  } // ./textFieldDidEndEditing
  
} // ./ChatController
