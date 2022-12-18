//
//  UITabBarItem+STBadgeView.swift
//  STBadge
//
//  Author: yyb 
//  Email:  cnjsyyb@163.com
//  Date:   2022/12/18
//
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

extension ST where Base: UITabBarItem {
    
    var addView:UIView {
        let tabBarButton = (self.base.value(forKey: "_view") as? UIView) ?? UIView()
        let imageView = tabBarButton.value(forKey: "_imageView")  as? UIImageView ?? UIImageView()
        return imageView
    }
    
    @discardableResult
    public func config(_ value:STBadgeConfiguration) -> Self {
        addView.st.config(value)
        return self
    }
    
    @discardableResult
    public func layout(_ value:STBadgeConfiguration.STBadgeLayoutEnum) -> Self {
        addView.st.layout(value)
        return self
    }
    
    @discardableResult
    public func offset(_ value:UIOffset) -> Self {
        addView.st.offset(value)
        return self
    }
    
    @discardableResult
    public func height(_ value:CGFloat) -> Self {
        addView.st.height(value)
        return self
    }
    
    
    public func showBadge(value:String?) {
        self.addView.st.showBadge(value: value)
    }
    
    public func hideBadge() {
        self.addView.st.hideBadge()
    }
    
}
