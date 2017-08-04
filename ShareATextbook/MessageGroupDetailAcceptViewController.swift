//
//  MessageGroupDetailAcceptViewController.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 4/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class MessageGroupDetailAcceptViewController: UIViewController {

    
    var messageGroup: MessageGroup!
    
    @IBOutlet weak var donorImg: UIImageView!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var resDate: UILabel!
    @IBOutlet weak var donorName: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var msgGrpStatus: UILabel!
    @IBOutlet weak var dismissBtn: UIButton!
    
    @IBAction func dimissAccepted(_ sender: Any) {
        RequestDataManager.messageGroupRespondReqDismiss(token: LoginGlobalVar.token, messagegrpid: messageGroup.messageGroupId)
    }
    
    func populateView() {
        bookTitle.text! = messageGroup.bookName
        donorName.text! = messageGroup.donorUserName
        resDate.text! = messageGroup.responseDate
        email.text! = messageGroup.contactEmail
        phone.text! = messageGroup.contactPhone
        
        if messageGroup.recptUserId == LoginGlobalVar.userId {
            msgGrpStatus.text! = "  Accepted by Donor"
        }
            
        else {
            msgGrpStatus.text! = "  Waiting for Dismissal"
            dismissBtn.isHidden = true
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

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
