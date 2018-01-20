//
//  ViewController.swift
//  chat-bubbles
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2018 Digices. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    // set tableView preferences
    self.tableView.separatorStyle = .none
    self.tableView.estimatedRowHeight = 44
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10); // top, left, bottom, right
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

}

