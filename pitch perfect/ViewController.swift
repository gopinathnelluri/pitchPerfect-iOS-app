//
//  ViewController.swift
//  pitch perfect
//
//  Created by Gopinath Nelluri on 12/19/15.
//  Copyright © 2015 Gopinath Nelluri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: UIButton) {
        //TODO: Show test "Recording in progress"
        recordingInProgress.hidden = false;
        //TODO: Record audio
        print("Recording");
    }
    @IBAction func stopButton(sender: UIButton) {
        recordingInProgress.hidden = true;
    }
}

