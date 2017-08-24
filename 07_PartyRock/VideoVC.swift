//
//  VideoVC.swift
//  07_PartyRock
//
//  Created by David Raygoza on 18/08/17.
//  Copyright © 2017 David Raygoza. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var webView: UIWebView!
    private var _partyRock: PartyRock!
    var partyRock: PartyRock{
        get{
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        

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
