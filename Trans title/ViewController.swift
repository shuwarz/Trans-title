//
//  ViewController.swift
//  Trans title
//
//  Created by 今泉　孝陽 on 2021/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var termOfServiceBotton: UIButton!
    @IBOutlet var supportBotton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ボタンの角を丸くする
        startButton.layer.cornerRadius = 10
        termOfServiceBotton.layer.cornerRadius = 10
        supportBotton.layer.cornerRadius = 10
    }


}

