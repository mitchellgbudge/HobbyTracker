//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Mitchell Budge on 8/13/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        friends.append(Friend(name: "Thor", hometown: "Asgard", hobbies: ["Electrocuting enemies"]))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendModalSegue" {
            if let addFriendVC = segue.destination as? AddFriendViewController {
                addFriendVC.delegate = self
            }
        }
    }
}


extension FriendsTableViewController: AddFriendDelegate {
    
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
}

extension FriendsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
    
}
