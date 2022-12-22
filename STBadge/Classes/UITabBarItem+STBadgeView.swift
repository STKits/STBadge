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
import ObjectiveC

extension ST where Base: UITabBarItem {
    
    // TODO: - 后续改变图片会引起addView等视图对象变化，导致之前添加badge消失, 此视图是不固定的
    var addView:UIView {
        guard let tabBarButton = (self.base.value(forKey: "_view") as? UIView),
              let imageView = tabBarButton.value(forKey: "_imageView")  as? UIImageView else {
            return UIImageView()
        }
        return imageView
    }
    
    @discardableResult
    public func config(_ value:STBadgeConfiguration) -> Self {
        addView.st.config(value)
        self.base.stBadgeConfig = addView.stBadgeConfig
        return self
    }
    
    @discardableResult
    public func layout(_ value:STBadgeConfiguration.STBadgeLayoutEnum) -> Self {
        addView.st.layout(value)
        self.base.stBadgeConfig = addView.stBadgeConfig
        return self
    }
    
    @discardableResult
    public func offset(_ value:UIOffset) -> Self {
        addView.st.offset(value)
        self.base.stBadgeConfig = addView.stBadgeConfig
        return self
    }
    
    @discardableResult
    public func height(_ value:CGFloat) -> Self {
        addView.st.height(value)
        self.base.stBadgeConfig = addView.stBadgeConfig
        return self
    }
    
    public func showBadge(value:String?) {
        self.addView.st.showBadge(value: value)
        self.base.stBadgeString = value
        UITabBarItem.swizzleSetView
    }
    
    public func hideBadge() {
        self.addView.st.hideBadge()
    }
    
}

/// 处理修改图片后view变化
private extension UITabBarItem {
    
    static let swizzleSetView: () = {
        let originalSelector = Selector(("setView:"))
        let swizzledSelector = #selector(UITabBarItem.swizzledSetView(_:))
        
        STRuntime.exchangeMethod(targetSelector: originalSelector,
                                 replaceSelector: swizzledSelector,
                                 targetClass: UITabBarItem.self)
    }()
    
    @objc func swizzledSetView(_ view:UIView) {
        swizzledSetView(view)
//        guard let imageView = view.value(forKey: "_imageView")  as? UIImageView else {
//            return
//        }
//        imageView.st.config(self.stBadgeConfig ?? view.stBadgeConfig)
//        imageView.st.showBadge(value: self.stBadgeString)
    }
    
}

/// 属性存到UITabBarItem里
private extension UITabBarItem {
    
    struct AssociatedKeys {
        static var badgeString   = "STBadgeStringKey"
        static var badgeConfig   = "STBadgeConfigKey"
    }
    
    var stBadgeString: String? {
        get {
            let str = objc_getAssociatedObject(self, &AssociatedKeys.badgeString) as? String
            return str
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeString, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var stBadgeConfig: STBadgeConfiguration? {
        get {
            let config = objc_getAssociatedObject(self, &AssociatedKeys.badgeConfig) as? STBadgeConfiguration
            return config
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.badgeConfig, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
