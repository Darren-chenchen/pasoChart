//
//  TopCell.swift
//  ios_table
//
//  Created by darren on 2018/9/6.
//  Copyright © 2018年 陈亮陈亮. All rights reserved.
//

import UIKit

class TopCell: UICollectionViewCell {
    lazy var titleLable: UILabel = {
        let title = UILabel.init(frame: CGRect.zero)
        return title
    }()
    lazy var lineView: UIView = {
        let line = UIView.init(frame: CGRect.zero)
        line.backgroundColor = UIColor.groupTableViewBackground
        return line
    }()
    lazy var bottomLineView: UIView = {
        let line = UIView.init(frame: CGRect.zero)
        line.backgroundColor = UIColor.groupTableViewBackground
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        initLayout()
    }
    
    func initView() {
        self.addSubview(self.titleLable)
        self.addSubview(self.lineView)
        self.addSubview(self.bottomLineView)

        self.titleLable.minimumScaleFactor = 0.1
        self.titleLable.adjustsFontSizeToFitWidth = true
    }
    
    func initLayout() {
        self.titleLable.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.lineView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(1)
            make.bottom.equalToSuperview()
        }
        self.bottomLineView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
