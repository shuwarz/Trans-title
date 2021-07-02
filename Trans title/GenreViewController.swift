//
//  GenreViewController.swift
//  Trans title
//
//  Created by 今泉　孝陽 on 2021/07/02.
//

import UIKit

class GenreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func japaneseToEnglish() {
        performSegue(withIdentifier: "toGameViewController", sender: "japaneseToEnglish")
    }
    
    @IBAction func EnglishTojapanese() {
        performSegue(withIdentifier: "toGameViewContoroller", sender: "EnglishTojapanese")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameViewContoroller" {
            let gameViewContoroller = segue.destination as! GameViewController
            gameViewContoroller.genre = sender as! String
        }
    }
}
