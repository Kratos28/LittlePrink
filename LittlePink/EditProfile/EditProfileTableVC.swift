//
//  EditProfileTableVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import UIKit


class EditProfileTableVC: UITableViewController {
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var brithLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    var avatar : UIImage?{
        didSet{
            DispatchQueue.main.async
            {
                self.avatarImageView.image =  self.avatar;
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        
    }
    
    
 

  
}
