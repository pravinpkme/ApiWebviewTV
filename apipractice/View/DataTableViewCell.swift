//
//  DataTableViewCell.swift
//  apipractice
//
//  Created by Pravin Kumar on 03/04/22.
//

import UIKit
import WebKit
class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var titile: UILabel!
    
    @IBOutlet weak var webview: WKWebView!
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
