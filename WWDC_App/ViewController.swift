//
//  ViewController.swift
//  WWDC_App
//
//  Created by Romi Phadte on 4/25/15.
//  Copyright (c) 2015 Romi Phadte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screensize: CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        
        //jUIView
        
        //firstPage.frame=CGRectMake(0, 0, screenWidth, screenHeight)
//        messages.frame=CGRectMake(screenWidth*0.1,screenHeight*0.1,40,40)
//        
//       self.firstPage.setNeedsDisplay()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

