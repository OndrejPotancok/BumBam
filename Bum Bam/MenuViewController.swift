//
//  ViewController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 06/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("startGame", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startGame" {
            
        }
    }

}

