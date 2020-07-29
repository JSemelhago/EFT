//
//  assessment.swift
//  App - CS
//
//  Created by Justin Semelhago & Hassaan Inayatali on 4/16/18.
//  Copyright © 2018 Justin Semelhago & Hassaan Inayatali. All rights reserved.
//

import UIKit


var value1=0

class assessment: UIViewController {
    
    @IBOutlet weak var firstQuestion: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (var1==1){
            firstQuestion.text=name2 + ", over the past 24 hours, how much did you think about your future events?"
            buttonWhite()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
        

    @IBAction func btn1Func(_ sender: Any) {
        if (btn1.backgroundColor==UIColor.white){
            btn1.backgroundColor=UIColor.blue
            btn2.backgroundColor=UIColor.white
            btn3.backgroundColor=UIColor.white
            btn4.backgroundColor=UIColor.white
            btn5.backgroundColor=UIColor.white
            value1=0
        }
        else{
            buttonWhite()
        }
}

    @IBAction func btn2Func(_ sender: Any) {
        if (btn2.backgroundColor==UIColor.white){
            btn2.backgroundColor=UIColor.blue
            btn1.backgroundColor=UIColor.white
            btn3.backgroundColor=UIColor.white
            btn4.backgroundColor=UIColor.white
            btn5.backgroundColor=UIColor.white
            value1=1
        }
        else{
            buttonWhite()
        }
        
    }
    
    @IBAction func btn3Func(_ sender: Any) {
        if (btn3.backgroundColor==UIColor.white){
            btn3.backgroundColor=UIColor.blue
            btn1.backgroundColor=UIColor.white
            btn2.backgroundColor=UIColor.white
            btn4.backgroundColor=UIColor.white
            btn5.backgroundColor=UIColor.white
            value1=3
        }
        else{
            buttonWhite()
        }
    }

    @IBAction func btn4Func(_ sender: Any) {
        if (btn4.backgroundColor==UIColor.white){
            btn4.backgroundColor=UIColor.blue
            btn1.backgroundColor=UIColor.white
            btn3.backgroundColor=UIColor.white
            btn2.backgroundColor=UIColor.white
            btn5.backgroundColor=UIColor.white
            value1=3
        }
        else{
            buttonWhite()
        }
    }
    
    @IBAction func btn5Func(_ sender: Any) {
        if (btn5.backgroundColor==UIColor.white){
            btn5.backgroundColor=UIColor.blue
            btn1.backgroundColor=UIColor.white
            btn3.backgroundColor=UIColor.white
            btn2.backgroundColor=UIColor.white
            btn4.backgroundColor=UIColor.white
            value1=4
        }
        else{
            buttonWhite()
        }
    }
    func buttonWhite(){
            btn1.backgroundColor=UIColor.white
            btn2.backgroundColor=UIColor.white
            btn3.backgroundColor=UIColor.white
            btn4.backgroundColor=UIColor.white
            btn5.backgroundColor=UIColor.white
        }
    }

