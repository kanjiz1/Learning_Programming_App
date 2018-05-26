//
//  ViewController.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/17/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

struct cellData{
    var opened = Bool()
    var title = String()
    var sectionData = [Any]()
}

class LeftMenu: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var leftMenuTable: UITableView!
    var tableViewData = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
         self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 70
        leftMenuTable.dataSource = self
        leftMenuTable.delegate = self
        
        tableViewData = [cellData(opened: false, title: "Languages", sectionData: DataService.instance.getLanguages())]
    }
    
    //number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    //number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData.count + 1
        } else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0{
            guard let cell = leftMenuTable.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell else {return UITableViewCell()}
            cell.cellTitle?.text = tableViewData[indexPath.section].title
            cell.cellImage.image = nil
             return cell
        }
        else{
            if let cell = leftMenuTable.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell{
                let languages = DataService.instance.getLanguages()[dataIndex]
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
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableViewData[indexPath.section].opened == true{
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else{
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none) // play with animations
            }
        }
    }
}

