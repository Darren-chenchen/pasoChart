//
//  LeftCell.swift
//  ios_table
//
//  Created by darren on 2018/9/6.
//  Copyright © 2018年 陈亮陈亮. All rights reserved.
//

import UIKit

class LeftCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.titleLabel.minimumScaleFactor = 0.1
        self.titleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    static func cellWithTableView(tableView:UITableView) -> LeftCell{
        let bundle = Bundle.main
        let ID = "LeftCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = bundle.loadNibNamed("LeftCell", owner: nil, options: nil)?.last as! LeftCell?
        }
        cell?.selectionStyle = .none
        cell?.backgroundColor = UIColor.clear
        return cell! as! LeftCell
    }
    

}
