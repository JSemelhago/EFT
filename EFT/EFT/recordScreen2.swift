//
//  recordScreen2.swift
//  App - CS
//
//  Created by Hassaan Inayatali on 4/3/18.
//  Copyright © 2018 Hassaan Inayatali. All rights reserved.
//

import UIKit
import AVFoundation

var counter1 = 0
var soundPlayer1 : AVAudioPlayer!


class recordScreen2: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if (counter1 == 0){
            setupRecorder()
            playBtn2.isEnabled = false
        }
        let url = getFileURL()
        do{
            soundPlayer1 = try AVAudioPlayer(contentsOf : url as URL)
        }catch{
            print(error)
        }
        if (soundPlayer1 == nil){
            playBtn2.isEnabled = false
        }
        counter1 += 1
    }

    var fileName1 = "audioFile1.aac"
    var soundRecorder : AVAudioRecorder!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var recordBtn2: UIButton!
    @IBOutlet weak var playBtn2: UIButton!
    @IBOutlet weak var nextBtn2: UIButton!
    
    func setupRecorder(){
        let recordSettings = [ AVFormatIDKey : kAudioFormatMPEG4AAC, AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue, AVEncoderBitRateKey : 320000, AVNumberOfChannelsKey : 2, AVSampleRateKey : 44100.0 ] as [String : Any]
        let _ : NSError?
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        }catch{
            print(error)
        }
        let url1 = getFileURL()
        do{
            soundRecorder = try AVAudioRecorder(url : url1 as URL, settings : recordSettings)
        }catch{
            print("Something went wrong")
        }
        soundRecorder.delegate = self
        soundRecorder.prepareToRecord()
    }
    
    func getCacheDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    open func getFileURL() -> NSURL{
        let pathURL = getCacheDirectory().appendingPathComponent(fileName1)
        let pathString = pathURL.path
        let filePath = NSURL(fileURLWithPath : pathString)
        return filePath
    }
    
    
    @IBAction func record2(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record"{
            setupRecorder()
            soundRecorder.deleteRecording()
            soundRecorder.record()
            sender.setTitle("Stop", for : .normal)
            playBtn2.isEnabled = false
            nextBtn2.isEnabled = false
        }else{
            soundRecorder.stop()
            sender.setTitle("Record", for : .normal)
            playBtn2.isEnabled = false
        }
    }
    
    @IBAction func playSound2(_ sender: UIButton) {
        if sender.titleLabel?.text == "Play"{
            recordBtn2.isEnabled = false
            nextBtn2.isEnabled = false
            sender.setTitle("Stop", for : .normal)
            preparePlayer()
            soundPlayer1.play()
        }else{
            soundPlayer1.stop()
            sender.setTitle("Play", for : .normal)
        }
    }
    
    func preparePlayer(){
        let _ : NSError?
        let url = getFileURL()
        do{
            soundPlayer1 = try AVAudioPlayer(contentsOf : url as URL)
        }catch{
            print(error)
        }
            soundPlayer1.delegate = self
            soundPlayer1.prepareToPlay()
            soundPlayer1.volume = 10.0
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        playBtn2.isEnabled = true
        nextBtn2.isEnabled = true
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordBtn2.isEnabled = true
        nextBtn2.isEnabled = true
        playBtn2.setTitle("Play", for : .normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
