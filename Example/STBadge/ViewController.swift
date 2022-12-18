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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        addChildViewController(childController:UIViewController())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let item = self.tabBar.items?.first
        item?.st
            .offset(UIOffset(horizontal: -8, vertical: 8))
            .layout(.leftBottomToTopRight)
            .height(16)
            .showBadge(value: "123")

        let view = UIView(frame: CGRect(x: 30, y: 200, width: 50, height: 50))
        view.backgroundColor = .gray
        self.view.addSubview(view)
        view.st.offset(UIOffset(horizontal: 0, vertical: 0)).showBadge(value: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
   
    private func addChildViewController(childController: UIViewController) {
        let image = UIImage(named: "aaa")?.withRenderingMode(.alwaysOriginal)
        let tabBarItem              = UITabBarItem(title: nil,
                                                   image: image,
                                                   selectedImage: image)
        childController.tabBarItem  = tabBarItem
        addChild(childController)
    }
    
   

}

