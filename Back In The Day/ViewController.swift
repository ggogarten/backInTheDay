//
//  ViewController.swift
//  Back In The Day
//
//  Created by George Gogarten on 6/20/16.
//  Copyright © 2016 George Gogarten. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func play(sender: AnyObject) {
       
        
        player.play()
        
        
    }
    
    
    @IBOutlet weak var volume: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volume.value
        
        
        
        
    }
    
    @IBOutlet weak var scrubSlider: UISlider!
    
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
        
        
        
    }
    
    
    @IBAction func stop(sender: AnyObject) {
     
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("backInTheDay", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            
            print("It didn't work")
            
        }
        
    }
    
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
        
    }
    
    func updateScrubSlider() {
        
        scrubSlider.value = Float(player.currentTime)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
        
       try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("backInTheDay", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            
            print("It didn't work")
            
        }
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

