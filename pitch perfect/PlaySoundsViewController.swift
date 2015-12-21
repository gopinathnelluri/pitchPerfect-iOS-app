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
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
