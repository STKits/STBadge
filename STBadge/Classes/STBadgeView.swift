//
//  STBadgeView.swift
//  STBadge
//
//  Author: yyb
//  Email:  cnjsyyb@163.com
//  Date:   2022/12/18
//
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

public class STBadgeView: UIView {
    
    private lazy var imageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var textLabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    private var config = STBadgeConfiguration()
    
    public private(set) var badgeValue:String?
    
    public init() {
        super.init(frame: .zero)
        bindProperty()
        bindView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.size.height / 2.0
    }
    
    private func bindView() {
        addSubview(imageView)
        imageView.addSubview(textLabel)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(config.height)
            make.width.greaterThanOrEqualTo(config.height)
        }
        textLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(config.textMargin)
            make.right.equalTo(-config.textMargin)
        }
    }
    
    private func bindProperty() {
        textLabel.font            = config.font
        textLabel.textColor       = config.textColor
        imageView.backgroundColor = config.backgroundColor
    }
    
    /// 配置
    @discardableResult
    public func config(_ config:STBadgeConfiguration) -> Self {
        self.config = config
        self.bindProperty()
        imageView.snp.updateConstraints { make in
            make.height.equalTo(config.height)
            make.width.greaterThanOrEqualTo(config.height)
        }
        textLabel.snp.updateConstraints { make in
            make.left.equalTo(config.textMargin)
            make.right.equalTo(-config.textMargin)
        }
        return self
    }
    /// 设置值
    @discardableResult
    public func setData(_ value:String?) -> Self {
        self.badgeValue = value
        if let maxNumber = self.config.maxNumber,
           let value = value, let textNumber = Int(value)  {
            textLabel.text = textNumber > maxNumber ? "\(maxNumber)+" : "\(textNumber)"
        } else {
            textLabel.text = value
        }
        return self
    }
    
}
