//
//  MessageGroupDetailViewController.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 3/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class MessageGroupDetailViewController: UIViewController {
    
    var messageGroup: MessageGroup!
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var msgGrpStatus: UILabel!
    @IBOutlet weak var recptImage: UIImageView!
    @IBOutlet weak var recptName: UILabel!
    @IBOutlet weak var reqDate: UILabel!
    @IBOutlet weak var donorImage: UIImageView!
    @IBOutlet weak var donorName: UILabel!
    @IBOutlet weak var resDate: UILabel!
    @IBOutlet weak var acptBtn: UIButton!
    @IBOutlet weak var rejBtn: UIButton!
    
    func populateView() {
        bookTitle.text! = messageGroup.bookName
        donorName.text! = messageGroup.donorUserName
        recptName.text! = messageGroup.recptUserName
        reqDate.text! = messageGroup.requestDate
        resDate.text! = messageGroup.responseDate
        
        if messageGroup.donorUserId == LoginGlobalVar.userId {
            msgGrpStatus.text! = "  Respond to Request"
        }
        
        else {
            msgGrpStatus.text! = "  Waiting for Response"
            acptBtn.isHidden = true
            rejBtn.isHidden = true
            
        }
    }
    
    @IBAction func acptBtnTouch(_ sender: Any) {
        var messageGroupId = messageGroup.messageGroupId
        RequestDataManager.messageGroupRespondAccept(token: LoginGlobalVar.token, messagegrpid: messageGroupId, email: "gmail.com", phone: "123")
    }
    
    @IBAction func rejBtnTouch(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        populateView()
        super.viewDidLoad()

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
