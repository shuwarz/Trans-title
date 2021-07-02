//
//  GameViewController.swift
//  Trans title
//
//  Created by 今泉　孝陽 on 2021/05/28.
//

import UIKit


class GameViewController: UIViewController {

    //問題文を格納する配列
    var quizArray = [Any]()
    
    //選択したジャンルを保存する変数
    var genre: String = ""
    
    //正解数を数えるための変数
    var correctAnser : Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizeArrayに問題文、4つの選択肢、答えの番号が入った配列を追加
        quizArray = QuizList.japaneseToEnglish
        
        //問題文をシャッフル
        quizArray.shuffle()
        // Do any additional setup after loading the view.
        
        choiceQuiz()
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        //引数のsender.tagに格納されているTagの値を使って処理を区別する
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[5] as! Int == sender.tag {
            
            //生回数を増やす
            correctAnser = correctAnser + 1
        }
        
        //といた問題をquizeArrayから取り除く
        quizArray.remove(at: 0)
        
        //といた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func choiceQuiz() {
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        choiceButton4.setTitle(tmpArray[4] as? String, for: .normal)
        
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }

    //セグエを準備(prepare)するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController; resultViewController.correctAnswer = self.correctAnser
        }
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
