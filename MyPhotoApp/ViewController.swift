//
//  ViewController.swift
//  MyPhotoApp
//
//  Created by Sergey Kargopolov on 2015-07-31.
//  Copyright (c) 2015 Sergey Kargopolov. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendButtonTapped(sender: AnyObject) {
     
       if(messageTextField.text.isEmpty)
       {
        return
       }
        
       let data = ["alert":messageTextField.text, "badge":"Increment"]
       let channels = ["Swift"]
        
       let push = PFPush()
        push.setData(data)
        push.setChannels(channels)
        push.sendPushInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if(success)
            {
               println("Success")
            } else
            {
                println(error?.localizedDescription)
            }
        }
        
        
    }

}

