//
//  NotificationsViewController.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 2/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var messageGroupTableView: UITableView!
    var messageGroupList : [MessageGroup] = []
    
    @IBAction func customSegmentValueChanged(_ sender: DesignableSegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            RequestDataManager.getAllMessageGroup(token: LoginGlobalVar.token, onComplete: {
                messageGroups in
                
                self.messageGroupList = messageGroups
                 self.messageGroupList.reverse()
                
                DispatchQueue.main.async {
                    self.messageGroupTableView.reloadData()
                }
                
            })
            break
        case 1:
            RequestDataManager.getAllPendingMessageGroup(token: LoginGlobalVar.token, onComplete: {
                messageGroups in
                
                self.messageGroupList = messageGroups
                self.messageGroupList.reverse()
                
                DispatchQueue.main.async {
                    self.messageGroupTableView.reloadData()
                }
                
            })
            break
        case 2:
            RequestDataManager.getAllDononrMessageGroup(token: LoginGlobalVar.token, onComplete: {
                messageGroups in
                
                self.messageGroupList = messageGroups
                self.messageGroupList.reverse()
                
                DispatchQueue.main.async {
                    self.messageGroupTableView.reloadData()
                }

            })
            break
        case 3:
            RequestDataManager.getAllRecipientMessageGroup(token: LoginGlobalVar.token, onComplete: {
                messageGroups in
                
                self.messageGroupList = messageGroups
                self.messageGroupList.reverse()
                
                DispatchQueue.main.async {
                    self.messageGroupTableView.reloadData()
                }
                
            })
            break
        default :
            RequestDataManager.getAllMessageGroup(token: LoginGlobalVar.token, onComplete: {
                messageGroups in
                
                self.messageGroupList = messageGroups
                self.messageGroupList.reverse()
                
                DispatchQueue.main.async {
                    self.messageGroupTableView.reloadData()
                }
                
            })
            break
        }
     
    }

    func loadDefaultFeed() {
        RequestDataManager.getAllMessageGroup(token: LoginGlobalVar.token, onComplete: {
            messageGroups in
            
            self.messageGroupList = messageGroups
            self.messageGroupList.reverse()
            
            DispatchQueue.main.async {
                self.messageGroupTableView.reloadData()
            }
            
        })
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageGroupList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = messageGroupTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? MessageGroupTableViewCell else { return UITableViewCell() }
        let messageGroup = messageGroupList[indexPath.row]
        cell.bookTitle.text! = messageGroup.bookName
        cell.donor.text! = messageGroup.donorUserName
        cell.recipient.text! = messageGroup.recptUserName
        cell.requestDate.text! = messageGroup.requestDate
        cell.responseDate.text! = messageGroup.responseDate
        
        if messageGroup.status == "requested" {
            cell.statusLbl.text = "Requested"
            cell.statusLbl.textColor = UIColor.white
            cell.statusLbl.backgroundColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1)
        }
        else if messageGroup.status == "accepted" {
            cell.statusLbl.text = "Accepted"
            cell.statusLbl.textColor = UIColor.white
            cell.statusLbl.backgroundColor = UIColor(red: 121/255, green: 200/255, blue: 154/255, alpha: 1)
        }
        
        else if messageGroup.status == "declined" {
            cell.statusLbl.text = "Declined"
            cell.statusLbl.textColor = UIColor.white
            cell.statusLbl.backgroundColor = UIColor(red: 255/255, green: 76/255, blue: 76/255, alpha: 1)
        }
        
        else if messageGroup.status == "accepted_dismissed" {
            cell.statusLbl.text = "Accepted Dismissed"
            cell.statusLbl.textColor = UIColor.white
            cell.statusLbl.backgroundColor = UIColor(red: 0/255, green: 123/255, blue:123/255, alpha: 1)
        }
        
        else if messageGroup.status == "rejected_dismissed" {
            cell.statusLbl.text = "Rejected Dismissed"
            cell.statusLbl.textColor = UIColor.white
            cell.statusLbl.backgroundColor = UIColor(red: 204/255, green: 60/255, blue: 60/255, alpha: 1)
        }
    
        cell.messageGroupImage.image = UIImage(named: String(indexPath.row))
        return cell
    }
 
    var selectedMessageGroup: MessageGroup?
    var rcptUserId: String?
    var donorUserId: String?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messageGroup = messageGroupList[indexPath.row]
        
        selectedMessageGroup = messageGroup
        
        if messageGroup.status == "requested" {
        
        self.performSegue(withIdentifier: "messageGroupDtl", sender: nil)
        }
            
        else if messageGroup.status == "accepted" {
            
            self.performSegue(withIdentifier: "messageGroupDtlAcpt", sender: nil)
        }
        
        else if messageGroup.status == "rejected" {
            
            self.performSegue(withIdentifier: "messageGroupDtlRej", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "messageGroupDtl" {
            let messageGroupDetailViewController = segue.destination as! MessageGroupDetailViewController
            messageGroupDetailViewController.messageGroup = selectedMessageGroup
        }
        
        else if segue.identifier == "messageGroupDtlAcpt" {
            let MessageGroupDetailAcceptViewController = segue.destination as! MessageGroupDetailAcceptViewController
            MessageGroupDetailAcceptViewController.messageGroup = selectedMessageGroup
        }
        
        else if segue.identifier == "messageGroupDtlRej" {
            let MessageGroupDetailRejectedViewController = segue.destination as! MessageGroupDetailRejectViewController
            MessageGroupDetailRejectedViewController.messageGroup = selectedMessageGroup
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultFeed()
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
