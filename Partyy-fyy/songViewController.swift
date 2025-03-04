//
//  songViewController.swift
//  Partyy-fyy
//
//  Created by OM KAMBLE on 12/04/23.
//

import UIKit
import AVFoundation

class songViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func playButton1(_ sender: UIButton) {
        playSound()
    }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "aiseNaMujhe", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
