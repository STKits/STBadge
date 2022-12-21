//
//  STBadgeConfiguration.swift
//  STBadge
//
//  Author: yyb 
//  Email:  cnjsyyb@163.com
//  Date:   2022/12/18
//
//  Copyright © 2022 CocoaPods. All rights reserved.
//
   
import UIKit

public struct STBadgeConfiguration {
    /// 默认配置，外部可以扩展一些其他的
    static var `default` = STBadgeConfiguration()
    
    public var backgroundColor:UIColor
    public var font:UIFont?
    public var textColor:UIColor?
    
    public var height:CGFloat
    public var textMargin:CGFloat
    public var offset:UIOffset
    
    public var layout:STBadgeLayoutEnum = .topRightToTopRight
    
    public init(backgroundColor: UIColor = UIColor.red,
                font: UIFont? = UIFont.systemFont(ofSize: 12),
                textColor: UIColor? = UIColor.white,
                height: CGFloat = 10,
                textMargin: CGFloat = 4.5,
                offset: UIOffset = .zero,
                layout: STBadgeLayoutEnum = .centerToTopRight) {
        self.backgroundColor = backgroundColor
        self.font = font
        self.textColor = textColor
        self.height = height
        self.textMargin = textMargin
        self.offset = offset
        self.layout = layout
    }
    
    /// 对齐方式
    public enum STBadgeLayoutEnum {
        // 右上对右上
        case topRightToTopRight
        // 左下对右上
        case leftBottomToTopRight
        // 中心对右上
        case centerToTopRight
    }
}
