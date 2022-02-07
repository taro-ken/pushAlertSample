//
//  ViewController.swift
//  pushAlertSample
//
//  Created by 木元健太郎 on 2022/02/04.
//


import UIKit

final class ViewController: UIViewController{
    
   
    @IBOutlet private weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = time.settingTime
        
    }
  
    
}

