//
//  MenuController.swift
//  Example
//
//  Created by Teodor Patras on 16/06/16.
//  Copyright © 2016 teodorpatras. All rights reserved.
//

import UIKit

class MenuController : UIViewController , UITableViewDelegate, UITableViewDataSource {
	
	var  segues : [String] = []
	private var previousIndex: NSIndexPath?
	
	
	@IBOutlet weak var tableView: UITableView!
	
	var menuArray : [[String : String]] = [
		["title" : "My Profile", "imageName" : "ic_myprofile"],
		["title" : "My Location", "imageName" : "ic_location"],
		["title" : "History", "imageName" : "ic_history"],
		["title" : "Feedback", "imageName" : "ic_feedback"],
		["title" : "LOG OUT", "imageName" : "ic_logout"]]
	override func viewDidLoad() {
		super.viewDidLoad()
		segues = ["showDashBoardVC", "showCenterController2", "showCenterController3"]
		navigationController?.navigationBar.isHidden = true
		//tableView.estimatedRowHeight = 60
		//tableView.rowHeight = UITableViewAutomaticDimension
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		if let index = previousIndex {
			tableView.deselectRow(at: index as IndexPath, animated: true)
		}
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return menuArray.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return tableView.frame.size.height/CGFloat(menuArray.count)
	}
	
	@IBAction func closeMenu(){
		sideMenuController?.toggle()
	}
	
	func tableView(_ tableView: UITableView,
	               cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell")!
		
		if let sidecell = cell as? SideMenuCell {
			if let imgName = menuArray[indexPath.row]["imageName"] {
				sidecell.imgView?.image = UIImage.init(named: imgName)
				
			}
			if let title = menuArray[indexPath.row]["title"] {
				sidecell.titleLabel?.text = title
			}
		}
		let view = UIView(frame: cell.frame)
		view.backgroundColor = UIColor(colorLiteralRed: 32/256.0, green: 33/256.0, blue: 34/256.0, alpha: 1.0)
		cell.selectedBackgroundView = view;
		return cell
	}
	
	func tableView(_ tableView: UITableView,
	               didSelectRowAt indexPath: IndexPath)  {
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		
		if indexPath.row < segues.count  {
			sideMenuController?.performSegue(withIdentifier: segues[indexPath.row], sender: nil)
			previousIndex = indexPath as NSIndexPath?
			
		}
		
	}
	
}

class SideMenuCell : UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel?
	@IBOutlet weak  var imgView: UIImageView?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}

