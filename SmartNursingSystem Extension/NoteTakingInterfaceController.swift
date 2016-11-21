//
//  NoteTakingInterfaceController.swift
//  NursingSystem
//
//  Created by  on 11/20/16.
//  Copyright © 2016 uhcl.edu. All rights reserved.
//

import WatchKit
import Foundation


class NoteTakingInterfaceController: WKInterfaceController {
    
    @IBOutlet var statuslbl: WKInterfaceLabel!
    
    @IBOutlet var play: WKInterfaceButton!
//    var saveUrl: NSURL?
    var url: NSURL{
        
        let fm = NSFileManager()
        
        let url = try! fm.URLForDirectory(NSSearchPathDirectory.MusicDirectory,
            
            inDomain: NSSearchPathDomainMask.UserDomainMask,
            
            appropriateForURL: nil, create: true)
            
            .URLByAppendingPathComponent("recording.m4a")
        
        return url
        
    }
    var status = ""{
        
        willSet{
            
            dispatch_async(dispatch_get_main_queue()){
                
                self.statuslbl.setText(newValue)
                
            }
            
        }
        
    }
    
    @IBAction func playAudio() {
        let options = [WKMediaPlayerControllerOptionsAutoplayKey : "true"]
        
        presentMediaPlayerControllerWithURL(url, options: options,
                                            completion: { didPlayToEnd, endTime, error in
                                                if let err = error {
                                                    print(err.description)
                                                }
        })
    }
    
    
    
    @IBAction func recordAudio() {
//        let duration = NSTimeInterval(10)
//        
//        let recordOptions =
//            [WKAudioRecorderControllerOptionsMaximumDurationKey : duration]
//        
//        presentAudioRecorderControllerWithOutputURL(saveUrl!,
//                                                    preset: .NarrowBandSpeech,
//                                                    options: recordOptions,
//                                                    completion: { saved, error in
//                                                        
//                                                        if let err = error {
//                                                            print(err.description)
//                                                        }
//                                                        
//                                                        if saved {
//                                                            self.play.setEnabled(true)
//                                                        }
//        })
//        
        
        
        let oneMinute: NSTimeInterval = 1 * 60
        
        let yes = NSNumber(bool: true)
        
        let no = NSNumber(bool: false)
        
        let options = [
            
            WKAudioRecorderControllerOptionsActionTitleKey : "Audio Recorder",
            
            WKAudioRecorderControllerOptionsAlwaysShowActionTitleKey : yes,
            
            WKAudioRecorderControllerOptionsAutorecordKey : no,
            
            WKAudioRecorderControllerOptionsMaximumDurationKey : oneMinute
            
        ]
        

        presentAudioRecorderControllerWithOutputURL(url,
                                                    
                                                    preset: WKAudioRecorderPreset.WideBandSpeech,
                                                    
                                                    options: options){
                                                        
                                                        success, error in
                                                        
                                                        defer{
                                                            
                                                            self.dismissAudioRecorderController()
                                                            
                                                        }
                                                        
                                                        guard success && error == nil else{
                                                            
                                                            self.status = "Failed to record"
                                                            
                                                            return
                                                            
                                                        }
                                                        
                                                        self.status = "Successfully recorded"
                                                        
        }
        
        
    }
    
    
    
    
    
    
    
    
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
//        let fileManager = NSFileManager.defaultManager()
//        
//        let container =
//            fileManager.containerURLForSecurityApplicationGroupIdentifier(
//                "group.com.example.Nursing.Audio")
//        
//        let fileName = "audioFile.wav"
//        
//        saveUrl = container?.URLByAppendingPathComponent(fileName)
//    
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
