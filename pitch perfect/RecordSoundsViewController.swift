//
//  RecordSoundsViewController.swift
//  pitch perfect
//
//  Created by Gopinath Nelluri on 12/19/15.
//  Copyright © 2015 Gopinath Nelluri. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder:AVAudioRecorder!
    var recodedAudio:RecordedAudio!
    
    @IBOutlet weak var recordingInProgress: UILabel!
    
    
    @IBOutlet weak var stopButton: UIButton!
    
    
    @IBOutlet weak var recordButton: UIButton!
    
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
        stopButton.hidden = false;
        recordButton.hidden = true;
        //TODO: Record audio
        print("Recording");
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()

        
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        
        //step 1: save audio
        recodedAudio =  RecordedAudio()
        recodedAudio.filePathUrl = recorder.url
        recodedAudio.title = recorder.url.lastPathComponent
        
        //step 2: move to next sceen
        self.performSegueWithIdentifier("stopRecording", sender: recodedAudio)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "stopRecording")
        {
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    @IBAction func stopButton(sender: UIButton) {
        recordingInProgress.hidden = true;
        recordButton.hidden = false;
        stopButton.hidden = true;
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
}

