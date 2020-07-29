//
//  cuesScreen.swift
//  App - CS
//
//  Created by Hassaan Inayatali on 4/3/18.
//  Copyright © 2018 Hassaan Inayatali. All rights reserved.
//

import UIKit
import AVFoundation

var x : AVAudioPlayer?
var y : AVAudioPlayer?
var z : AVAudioPlayer?

class cuesScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var shortBtn: UIButton!
    @IBOutlet weak var medBtn: UIButton!
    @IBOutlet weak var longBtn: UIButton!
    
    @IBAction func shortPlay(_ sender: UIButton){
        sender.pulsate()
        do{
            x = try AVAudioPlayer(contentsOf : recordScreen().getFileURL() as URL)
            guard let player = x else {return}
            player.prepareToPlay()
            player.volume = 10.0
            player.play()
        }catch{
            print(error)
        }
    }
    
    @IBAction func medPlay(_ sender: UIButton) {
        sender.pulsate()
        do{
            y = try AVAudioPlayer(contentsOf : recordScreen2().getFileURL() as URL)
            guard let player = y else {return}
            player.prepareToPlay()
            player.volume = 10.0
            player.play()
        }catch{
            print(error)
        }
    }
    
    @IBAction func longPlay(_ sender: UIButton) {
        sender.pulsate()
        do{
            z = try AVAudioPlayer(contentsOf : recordScreen3().getFileURL() as URL)
            guard let player = z else {return}
            player.prepareToPlay()
            player.volume = 10.0
            player.play()
        }catch{
            print(error)
        }
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
