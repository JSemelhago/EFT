//
//  aboutScreen.swift
//  App - CS
//
//  Created by Justin Semelhago & Hassaan Inayatali on 4/3/18.
//  Copyright © 2018 Justin Semelhago & Hassaan Inayatali. All rights reserved.
//

import UIKit

class aboutScreen: UIViewController {

    @IBOutlet weak var aboutLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutLbl.text = "This app was created using the ideology of EFT(Episodic Future Thinking). The idea behind this is that addiction patients have a tendency to give up a long-term large reward, such as being  with their family in exchange for the more short-term reward, such as whatever substance the patient craves. With this app, the  patient will be able to have constant reminders of their future goals to prevent delayed discounting(the aforementioned process). \n\nWe hope you find this app useful in whatever need it may serve.\n\nThank you! "
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
