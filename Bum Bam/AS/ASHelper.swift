//
//  ASHelper.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/25/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ASHelper {
    
    class Animal {
        var imageName: String
        var image: UIImage! {
            return UIImage(named: self.imageName)
        }
        
        var soundName: String
        var _sound: AVAudioPlayer!
        var sound: AVAudioPlayer {
            if self._sound == nil {
                let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundName, ofType: "mp3")!)
                do {
                    self._sound = try AVAudioPlayer(contentsOfURL: soundURL)
                } catch {
                    
                }
            }
            return self._sound
        }
        
        init(imageName: String, soundName: String) {
            self.imageName = imageName
            self.soundName = soundName
        }
    }
    
}