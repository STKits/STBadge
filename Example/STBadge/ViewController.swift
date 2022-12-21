//
//  ViewController.swift
//  STBadge
//
//  Created by cnjsyyb on 12/18/2022.
//  Copyright (c) 2022 cnjsyyb. All rights reserved.
//

import UIKit
import STBadge

class ViewController: UITabBarController {
    
    private lazy var testView = UIView(frame: CGRect(x: 30, y: 200, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        addChildViewController(childController:UIViewController())
        addChildViewController(childController:UIViewController())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let item = self.tabBar.items?.first
//        item?.st
//            .offset(UIOffset(horizontal: -8, vertical: 8))
//            .layout(.leftBottomToTopRight)
//            .height(16)
//            .showBadge(value: "123")
        item?.st.height(16).showBadge(value: "12")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            item?.selectedImage = UIImage(systemName: "ellipsis.message")
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            item?.selectedImage = UIImage(systemName: "house.fill")
//            item?.st.showBadge(value: "")
//        }
        
        testView.backgroundColor = .gray
        self.view.addSubview(testView)
        testView.st.offset(UIOffset(horizontal: 0, vertical: 0)).showBadge(value: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
   
    private func addChildViewController(childController: UIViewController) {
        let image = UIImage(systemName: "house.fill")
        let tabBarItem              = UITabBarItem(title: "Home",
                                                   image: image,
                                                   selectedImage: image)
        childController.tabBarItem  = tabBarItem
        addChild(childController)
    }
    
   

}

