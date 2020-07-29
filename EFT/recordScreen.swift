//
//  recordScreen.swift
//  App - CS
//
//  Created by Hassaan Inayatali on 3/28/18.
//  Copyright © 2018 Hassaan Inayatali. All rights reserved.
//


import UIKit
import AVFoundation
import UserNotifications

var counter = 0
var soundPlayer : AVAudioPlayer!

extension recordScreen 	: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    
}

class recordScreen: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    override func viewDidLoad() {
        UNUserNotificationCenter.current().delegate = self
        createNotification()
        super.viewDidLoad()
        if (counter == 0){
            setupRecorder()
            playBtn.isEnabled = false
        }
        let url = getFileURL()
        do{
            soundPlayer = try AVAudioPlayer(contentsOf : url as URL)
        }catch{
            print(error)
        }
        if (soundPlayer == nil){
            playBtn.isEnabled = false
        }else{
            playBtn.isEnabled = true
        }
        counter += 1
    }
    
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var fileName = "audioFile.aac"
    var soundRecorder : AVAudioRecorder!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "You will be notified in a few seconds"
        content.body = "The notification will inform you of your EFT"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) {(error) in print(error as Any)}
    }
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

    /*
     Pre: fileName has to be declared as a name of an aac file. getCacheDirectory() finds a temporary folder to place the audio
     Post: Returns the permanent directory based off directories either on the phone or simulator
     What it specifically returns is the Objective-C class in form of a NSURL which is then converted to a Swift structure URL
     */
    open func getFileURL() -> NSURL{
        let pathURL = getCacheDirectory().appendingPathComponent(fileName)
        let pathString = pathURL.path
        let filePath = NSURL(fileURLWithPath : pathString)
        return filePath
    }
    
   
    @IBAction func record(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record"{
            setupRecorder()
            soundRecorder.deleteRecording()
            soundRecorder.record()
            sender.setTitle("Stop", for : .normal)
            playBtn.isEnabled = false
            nextBtn.isEnabled = false
        }else{
            soundRecorder.stop()
            sender.setTitle("Record", for : .normal)
            playBtn.isEnabled = false
        }
    }
    
    
    @IBAction func playSound(_ sender: UIButton) {
        if sender.titleLabel?.text == "Play"{
            recordBtn.isEnabled = false
            nextBtn.isEnabled = false
            sender.setTitle("Stop", for : .normal)
            preparePlayer()
            soundPlayer.play()
        }else{
            soundPlayer.stop()
            sender.setTitle("Play", for : .normal)
        }
    }
    
    func preparePlayer(){
        let _ : NSError?
        let url = getFileURL()
        do{
            soundPlayer = try AVAudioPlayer(contentsOf : url as URL)
        }catch{
            print(error)
        }
        soundPlayer.delegate = self
        soundPlayer.prepareToPlay()
        soundPlayer.volume = 10.0
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        playBtn.isEnabled = true
        nextBtn.isEnabled = true
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordBtn.isEnabled = true
        nextBtn.isEnabled = true
        playBtn.setTitle("Play", for : .normal)
    }
}


