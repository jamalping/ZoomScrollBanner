//
//  ViewController.swift
//  BannerView
//
//  Created by jamalping on 09/28/2018.
//  Copyright (c) 2018 jamalping. All rights reserved.
//

import UIKit
import BannerView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let banaView = BannerView.init(frame: self.view.bounds)
        self.view.addSubview(banaView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

