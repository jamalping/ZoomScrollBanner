//
//  UICollectionCell.swift
//  BannerView
//
//  Created by jamalping on 2018/10/10.
//

import Foundation

let kJLXWidthScale = UIScreen.main.bounds.size.width/375.0/2.0       //以6/6s为准宽度缩小系数
let kJLXHeightScale = UIScreen.main.bounds.size.height/667.0/2.0      //高度缩小系数
let kJLXBackgroundColor = UIColor.init(red: 253.0/255.0, green: 242.0/255.0, blue: 236.0/255.0, alpha: 1) //背景颜色-米黄

let JLXScreenSize = UIScreen.main.bounds.size     //屏幕大小
let JLXScreenOrigin = UIScreen.main.bounds.origin                     //屏幕起点



class UICollectionCell: UICollectionViewCell {
    class var reuseIdentifier: String {
        return "\(self)"
    }
    var coverImgView: UIImageView?
    
    let textLabel: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 320, height: 30))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.coverImgView?.image = nil
        self.coverImgView?.frame = self.contentView.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.init(red: 232.0/255.0, green: 163.0/255.0, blue: 136/255.0, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize.init(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 5.0

        self.coverImgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 474.0*kJLXWidthScale, height: 848.0*kJLXHeightScale))
        self.coverImgView?.isUserInteractionEnabled = true
        self.coverImgView?.layer.masksToBounds = true
        self.coverImgView?.layer.cornerRadius = 8.0
        self.contentView.addSubview(self.coverImgView!)
        self.contentView.addSubview(self.textLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
