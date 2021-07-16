//
//  ViewController.swift
//  Trans title
//
//  Created by 今泉　孝陽 on 2021/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ボタンの角を丸くする
        startButton.layer.cornerRadius = 10
    }


}

