//
//  ViewController.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/17/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class LeftMenu: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var leftMenuTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
         self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 70
        leftMenuTable.dataSource = self
        leftMenuTable.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return DataService.instance.getLanguages().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = leftMenuTable.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell{
            let languages = DataService.instance.getLanguages()[indexPath.row]
            cell.updateViews(category: languages)
            cell.layer.cornerRadius = 2.0
            
            let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width - 20, height: 120))
            
//            whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])
            
            whiteRoundedView.layer.masksToBounds = false
            whiteRoundedView.layer.cornerRadius = 2.0
            whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
            whiteRoundedView.layer.shadowOpacity = 0.2
            
            cell.contentView.addSubview(whiteRoundedView)
            cell.contentView.sendSubview(toBack: whiteRoundedView)
            return cell
        } else{
            return CustomCell()
        }
    }
}

