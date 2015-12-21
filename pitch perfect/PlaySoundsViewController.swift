//
//  PlaySoundsViewController.swift
//  pitch perfect
//
//  Created by Gopinath Nelluri on 12/20/15.
//  Copyright © 2015 Gopinath Nelluri. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote",ofType: "mp3"){
//            let filePathUrl = NSURL.fileURLWithPath(filePath);
//            
//        }
//        else{
//            print("The filepath is empty");
//        }
//        
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl);
        }
        catch{
            print("audio file not loaded");
        }
        
        audioPlayer.enableRate = true;
        audioEngine = AVAudioEngine();
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chipmunk(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }

    @IBAction func darthvader(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    
    @IBAction func snail(sender: UIButton) {
        audioPlayer.stop();
        audioPlayer.rate = 0.5;
        audioPlayer.currentTime = 0.0;
        audioPlayer.play();
    }
    
    @IBAction func rabit(sender: UIButton) {
        audioPlayer.stop();
        audioPlayer.rate = 1.5;
        audioPlayer.currentTime = 0.0;
        audioPlayer.play();
    }
    
    @IBAction func stop(sender: UIButton) {
        audioPlayer.stop();
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
