//
//  HomeViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 6/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
// https://www.newventuresoftware.com/blog/organizing-xcode-projects-using-multiple-storyboards

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var sizeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentChanged(sender: Any)
    {
        if (sizeSegment.selectedSegmentIndex == 2)
        {
            var storyboard = UIStoryboard(name: "Upload", bundle: nil)
            var controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
    
            self.present(controller, animated:true, completion:nil)
        }
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
