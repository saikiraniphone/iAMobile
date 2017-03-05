//
//  DashBoardVC.swift
//  IAMobile
//
//  Created by sai on 26/02/17.
//  Copyright © 2017 Sai. All rights reserved.
//

import UIKit
import SideMenuController

class DashBoardVC: UIViewController, SideMenuControllerDelegate, UICollectionViewDelegate , UICollectionViewDataSource {

	@IBOutlet var collectionView  : UICollectionView?
	
	var menuArray : [[[String : String]]] = [
		[["title" : "My PANEL", "imageName" : "mod_mypanel"],
		["title" : "My BENEFIT", "imageName" : "ic_location"]],
		[["title" : "My CLAIM", "imageName" : "discharge_pros"],
		["title" : "PRE ADMISSION", "imageName" : "mod_preadmission"]],
		[["title" : "MY CARD", "imageName" : "mod_mycard"]]]

	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 0, green: 0, blue: 1/255.0, alpha: 1.0)
		
		guard let image = UIImage.init(named: "logo") else {
			return
		}
		self.title = "IAmobile"
		var items = self.navigationItem.leftBarButtonItems
		let button = UIButton(frame: CGRect(x: 0, y: 7, width: 30, height: 30))
		button.accessibilityIdentifier = SideMenuController.preferences.interaction.menuButtonAccessibilityIdentifier
		button.setImage(image, for: .normal)
		//button.addTarget(sideMenuController, action: #selector(SideMenuController.toggle), for: UIControlEvents.touchUpInside)
		
		let item:UIBarButtonItem = UIBarButtonItem()
		item.customView = button
		
		let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
		spacer.width = -10
		
		items?.append(item)
		items?.append(spacer)
		self.navigationItem.leftBarButtonItems = items

		guard let searchImage = UIImage.init(named: "logo") else {
			return
		}
		

		let searchBtn = UIButton(frame: CGRect(x: 0, y: 7, width: 30, height: 30))
		button.setImage(searchImage, for: .normal)

		let rightItem:UIBarButtonItem = UIBarButtonItem()
		rightItem.customView = searchBtn
		self.navigationItem.rightBarButtonItems = [rightItem]
		
		//self.collectionView?.register(DashBoardCell.self, forCellWithReuseIdentifier: "cell")

    }
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		if section != 2 {
		return 2
		}
		else {
		return 1
		}
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		if let sidecell = cell as? DashBoardCell {
			if let imgName = menuArray[indexPath.section][indexPath.item]["imageName"] {
				sidecell.imgView?.image = UIImage.init(named: imgName)
				
			}
			if let title = menuArray[indexPath.section][indexPath.item]["title"] {
				sidecell.titleLbl?.text = title
			}
		}

		
		return cell
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func sideMenuControllerDidHide(_ sideMenuController: SideMenuController) {
		print(#function)
	}
	
	func sideMenuControllerDidReveal(_ sideMenuController: SideMenuController) {
		print(#function)
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

class DashBoardCell: UICollectionViewCell {
	
	@IBOutlet weak var imgView: UIImageView!
	
	@IBOutlet weak var titleLbl: UILabel!
}

