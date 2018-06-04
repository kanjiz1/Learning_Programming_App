//
//  ViewController.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 5/17/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Firebase

struct cellData{
    var opened = Bool()
    var title = String()
    var sectionData = [LearningTopic]()
}

class LeftMenu: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var leftMenuTable: UITableView!
    var tableViewData = [cellData]()
    
    var languageOptions = ["Java", "C++", "Swift"]
    var learningOptions = ["Algorithms", "DataStructures", "Regex", "TutorialsPoint", "Google"]
    
    var username: String?
    
    let storagePath = UserDefaults.standard.object(forKey: "uid") as? String 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 70
        
        leftMenuTable.dataSource = self
        leftMenuTable.delegate = self
        
        tableViewData = [cellData(opened: false, title: "Languages", sectionData: DataService.instance.getLanguages()),
        cellData(opened: false, title: "Learning", sectionData: DataService.instance.getLearning())]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDefaults.standard.bool(forKey: "uid") == true{
            username = Auth.auth().currentUser!.displayName
            loginButton.setTitle("Logout \(username!)", for: .normal)
        }
        loginButton.setNeedsDisplay()
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if loginButton.currentTitle == "Login"{
            if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: TO_LOGIN) as? LoginVC {
                loginButton.setTitle("Logout", for: .normal)
                self.present(presentedViewController, animated: true, completion: nil)
            }
            
        } else if loginButton.currentTitle == "Logout"{
            print("ookay!!!")
            loginButton.setTitle("Login", for: .normal)
            do{
                try Auth.auth().signOut()
                print("Signed Out")
                DispatchQueue.main.async {
                    UserDefaults.standard.removeObject(forKey: "uid")
                    UserDefaults.standard.synchronize()
                }
            } catch{
                print(error.localizedDescription)
            }
        }
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
            cell.cellTitle.font = UIFont.boldSystemFont(ofSize: cell.cellTitle.font.pointSize)
            if tableViewData[indexPath.section].opened == false {
                cell.cellImage.image = UIImage(named: "expand.png")
            } else{
                cell.cellImage.image = UIImage(named: "collapse.png")
            }
             return cell
        }
        else{
            if let cell = leftMenuTable.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell{
                if tableViewData[indexPath.section].title == "Languages"{
                    let languages = DataService.instance.getLanguages()[dataIndex]
                    cell.updateViews(category: languages)
                    cell.layer.cornerRadius = 2.0
                    cell.cellTitle.font = UIFont.systemFont(ofSize: cell.cellTitle.font.pointSize)
                }
                
                if tableViewData[indexPath.section].title == "Learning"{
                    let languages = DataService.instance.getLearning()[dataIndex]
                    cell.updateViews(category: languages)
                    cell.layer.cornerRadius = 2.0
                    cell.cellTitle.font = UIFont.systemFont(ofSize: cell.cellTitle.font.pointSize)
                }
                
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
        } else{
            if indexPath.section == 0 {
                self.performSegue(withIdentifier: languageOptions[indexPath.row - 1], sender: self)
            } else if indexPath.section == 1{
                self.performSegue(withIdentifier: learningOptions[indexPath.row - 1], sender: self)
            }
        }
    }
    
    
    
}

