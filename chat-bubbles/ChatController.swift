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
  
  @IBAction func send(_ sender: UIButton) {
    if let text = self.textField.text {
      if text.count > 0 {
        let message = Message(time: Date(), string: text, sent: true)
        self.objects.append(message)
        self.textField.text = ""
        self.tableView.reloadData()
      }
    }
  }
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // set tableView preferences
    self.tableView.separatorStyle = .none
    self.tableView.estimatedRowHeight = 44
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10); // top, left, bottom, right
    
    self.borderView.layer.borderColor = UIColor.lightGray.cgColor
    self.borderView.layer.borderWidth = 1
    self.borderView.layer.cornerRadius = 18
    
    self.sendButton.isEnabled = false
    self.sendButton.tintColor = .lightGray
    
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.objects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatCell
    let message = self.objects[indexPath.row]
    cell.configureCell(sent: message.sent, string: message.string)
    return cell
  }
  
  // MARK: - UITextFieldDelegate
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.send(self.sendButton)
    self.view.endEditing(true)
    return true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.sendButton.isEnabled = true
    self.sendButton.tintColor = UIColor(red: 15/255, green: 121/255, blue: 252/255, alpha: 1)
    let offset = CGPoint(x: 0, y: self.tableView.bounds.size.height - self.tableView.contentSize.height)
    self.tableView.setContentOffset(offset, animated: true)
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.sendButton.isEnabled = false
    self.sendButton.tintColor = .lightGray
  }
  
}
