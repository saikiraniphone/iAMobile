//
//  SelectOptionViewController.swift
//  IAMobile
//
//  Created by Ramesh Muthe on 26/02/17.
//  Copyright © 2017 Sai. All rights reserved.
//

import UIKit

class SelectOptionViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectOptionAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Registration", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier :"loginviewController") as! LoginViewController
        if((sender as! UIButton).tag == 1){
            viewController.isMemberLogin = true

        } else{
            viewController.isMemberLogin = false

        }
        self.present(viewController, animated: true)
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
