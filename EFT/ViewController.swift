//
//  ViewController.swift
//  App - CS
//
//  Created by Hassaan Inayatali on 3/28/18.
//  Copyright © 2018 Hassaan Inayatali. All rights reserved.
//

import UIKit
import AVFoundation
var name2=""
var var1=0
class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var EFTHomeScreen: UIImageView!
    @IBOutlet weak var nameTextFld: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var homeRecBtn: UIButton!
    @IBOutlet weak var cuesBtn: UIButton!
    @IBOutlet weak var aboutBtn: UIButton!
    
    override func viewDidLoad() {
        if var1==1{
            super.viewDidLoad()
            nameLbl.isHidden=true
            nameTextFld.isHidden=true
            submitBtn.isHidden=true
            homeRecBtn.isHidden=false
            cuesBtn.isHidden=false
            aboutBtn.isHidden=false
            EFTHomeScreen.isHidden=true
            backImage.isHidden=false
        }
        else{
            super.viewDidLoad()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func submitBtnFunc(_ sender: Any) {

        view.endEditing(true)
        let val: String? = nameTextFld.text
        name2=val!
        let alert = UIAlertController(title: "Is this information correct?", message: "Please confirm the information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.nameLbl.isHidden=true
            self.nameTextFld.isHidden=true
            self.submitBtn.isHidden=true
            self.EFTHomeScreen.isHidden=true
            self.backImage.isHidden=false
            self.homeRecBtn.isHidden=false
            self.cuesBtn.isHidden=false
            self.aboutBtn.isHidden=false
            var1=1
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert,animated: true)
        /*
        while (name2.isEmpty==true){
            print("HELLO")
            self.present(blank,animated: true)
            val = nameTextFld.text
            name2=val!
        }
        */
 
        
        
    }
    
    func alert(action: UIAlertAction){
        
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

}

