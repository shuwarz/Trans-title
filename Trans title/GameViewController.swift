//
//  GameViewController.swift
//  Trans title
//
//  Created by 今泉　孝陽 on 2021/05/28.
//

import UIKit


class GameViewController: UIViewController {

    //問題文を格納する配列
    var quizeArray = [Any]()
    
    //正解数を数えるための変数
    var correctAnser : Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizeTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizeArrayに問題文、３つの選択肢、答えの番号が入った配列を追加
        quizeArray.append(["問題文1","選択肢1","選択肢2","選択肢3",2])
        quizeArray.append(["問題文2","選択肢1","選択肢2","選択肢3",1])
        quizeArray.append(["問題文3","選択肢1","選択肢2","選択肢3",3])
        quizeArray.append(["問題文4","選択肢1","選択肢2","選択肢3",3])
        quizeArray.append(["問題文5","選択肢1","選択肢2","選択肢3",2])
        quizeArray.append(["問題文6","選択肢1","選択肢2","選択肢3",1])
        
        //問題文をシャッフル
        quizeArray.shuffle()
        
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

}
