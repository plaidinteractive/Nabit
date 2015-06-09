//
//  DisplayViewController.swift
//  Nabit 1.0
//
//  Created by Michael Manchakowski on 2015-05-21.
//  Copyright (c) 2015 Michael Manchakowski. All rights reserved.
//

import UIKit
import Foundation


class DisplayViewController: UIViewController {
   
    var currentPhoto : Photo?
    
    @IBOutlet weak var currentImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = UIImage(named: currentPhoto!.filename)
        currentImage.image = image
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
       // var thirdScene = segue.destinationViewController as! InfoViewController
       // thirdScene.currentPhoto = currentPhoto
        
//}
        // Pass the selected object to the new view controller.
}

