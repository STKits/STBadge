//
//  UIView+STBadge.swift
//  STBadge
//
//  Author: yyb 
//  Email:  cnjsyyb@163.com
//  Date:   2022/12/18
//
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

public struct ST<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public extension NSObjectProtocol {
    var st: ST<Self> {
        return ST(self)
    }
}

private struct AssociatedKeys {
    static var badgeView   = "STBadgeViewKey"
    static var badgeConfig = "STBadgeConfigKey"
}

private extension UIView {
    var badgeView: STBadgeView {
        get {
            if let view = objc_getAssociatedObject(self, &AssociatedKeys.badgeView) as? STBadgeView {
                return view
            }
            let view = STBadgeView()
            objc_setAssociatedObject(self, &AssociatedKeys.badgeView, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return view
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var badgeConfig: STBadgeConfiguration {
        get {
            if let config = objc_getAssociatedObject(self, &AssociatedKeys.badgeConfig) as? STBadgeConfiguration {
                return config
            }
            let config = STBadgeConfiguration.default
            objc_setAssociatedObject(self, &AssociatedKeys.badgeConfig, config, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return config
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeConfig, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension ST where Base: UIView {
    
    var addView:UIView {
        return self.base
    }
    
    var badgeView:STBadgeView {
        return self.base.badgeView
    }
    
    var badgeConfig: STBadgeConfiguration {
        return self.base.badgeConfig
    }
   
    @discardableResult
    public func config(_ value:STBadgeConfiguration) -> Self {
        self.base.badgeConfig = value
        return self
    }
    
    @discardableResult
    public func layout(_ value:STBadgeConfiguration.STBadgeLayoutEnum) -> Self {
        self.base.badgeConfig.layout = value
        return self
    }
    
    @discardableResult
    public func offset(_ value:UIOffset) -> Self {
        self.base.badgeConfig.offset = value
        return self
    }
    
    @discardableResult
    public func height(_ value:CGFloat) -> Self {
        self.base.badgeConfig.height = value
        return self
    }
    
    public func showBadge(value:String?) {
        self.badgeView.isHidden = false
        if badgeView.superview == nil {
            addView.addSubview(badgeView)
        }
        
        // 赋值
        self.badgeView.bindData(value)
        
        // 布局
        let config = badgeConfig
        self.badgeView.updateConfig(config)
        let offset = config.offset
        
        if config.layout == .topRightToTopRight {
            addView.backgroundColor = .yellow
            badgeView.snp.remakeConstraints { make in
                make.top.equalToSuperview().offset(offset.vertical)
                make.right.equalToSuperview().offset(offset.horizontal)
            }
        } else if config.layout == .leftBottomToTopRight {
            badgeView.snp.remakeConstraints { make in
                make.left.equalTo(addView.snp.right).offset(offset.horizontal)
                make.bottom.equalTo(addView.snp.top).offset(offset.vertical)
            }
        } else if config.layout == .centerToTopRight {
            badgeView.snp.remakeConstraints { make in
                make.centerX.equalTo(addView.snp.right).offset(offset.horizontal)
                make.centerY.equalTo(addView.snp.top).offset(offset.vertical)
            }
        }
        
        
    }
    
    public func hideBadge() {
        self.badgeView.isHidden = true
    }
}
