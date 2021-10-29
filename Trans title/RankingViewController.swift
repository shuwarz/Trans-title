//
//  RankingViewController.swift
//  Trans title
//
//  Created by Tomoya Tanaka on 2021/10/29.
//

import UIKit

class RankingViewController: UIViewController {
	@IBOutlet var firstLabel: UILabel!
	@IBOutlet var secondLabel: UILabel!
	@IBOutlet var thirdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
		let rankingArray = UserDefaults.standard.object(forKey: "ranking") as! [Int]
		
			if rankingArray.indices.contains(0) {
				firstLabel.text = "1位: \(String(rankingArray[0]))"
			} else {
				firstLabel.text = "1位：----------"
			}
			
			if rankingArray.indices.contains(1) {
				secondLabel.text = "2位: \(String(rankingArray[1]))"
			} else {
				secondLabel.text = "2位：----------"
			}
			
			if rankingArray.indices.contains(2) {
				thirdLabel.text = "3位: \(String(rankingArray[2]))"
			} else {
				thirdLabel.text = "3位：----------"
			}
    }
    

}
