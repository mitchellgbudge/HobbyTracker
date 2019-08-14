//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Mitchell Budge on 8/14/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var numberOfHobbiesLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        numberOfHobbiesLabel.text = "\(friend.hobbies.count)"
    }

}
