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
    
    //タイムリミットを表示するバー
    @IBOutlet var timeLimitBar: UIView!
    var timeLimitBarWidth: CGFloat = 0
    //回答したかどうかを判定
    var answered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //もしgenreに入っている文字列がjapaneseToEngilishAnimeだったら
            //quizeArrayにQuizList.japaneseToEnglishAnimeの値を入れる
        if genre == "japaneseToEnglishAnime" {
            quizArray = QuizList.japaneseToEnglishAnime
            
        }
        //もしgenreに入っている文字列がjapaneseToEngilishMovieだったら
            //quizeArrayにQuizList.japaneseToEnglishMovieの値を入れる
        if genre == "japaneseToEnglishMovie" {
            quizArray = QuizList.japaneseToEnglishMovie
            
        }
        
        //問題文をシャッフル
        quizArray.shuffle()
        // Do any additional setup after loading the view.
        
        choiceQuiz()
        //ボタンの角を丸くする
        choiceButton1.layer.cornerRadius = 10
        choiceButton2.layer.cornerRadius = 10
        choiceButton3.layer.cornerRadius = 10
        choiceButton4.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 縮まる前のバーの横幅を保存しておく
        timeLimitBarWidth = timeLimitBar.frame.width
        //　カウントダウン開始！
        startTimer()
    }
        
    @IBAction func choiceAnswer(sender: UIButton) {
        //回答したことを伝える
        self.answered = true
        //引数のsender.tagに格納されているTagの値を使って処理を区別する
        
        let tmpArray = quizArray[0] as! [Any]
        print(tmpArray[5], sender.tag)
        if tmpArray[5] as! Int == sender.tag {
            print("correct")
            //生回数を増やす
            correctAnser = correctAnser + 1
        }
        
        //といた問題をquizeArrayから取り除く
        quizArray.remove(at: 0)
        
        //といた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            //タイムリミットバーのアニメーションを中止
            self.timeLimitBar.layer.removeAllAnimations()
            performSegueToResult()
        } else {
            choiceQuiz()
            //タイマースタート！
            startTimer()
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
    
    //　制限時間が来た時に不正解にして次の問題に進む
    func skipAnswer() {
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題数の合計があらかじめ設定数に達したら結果画面へ
        if quizArray.count == 0 {
            //アニメーションをキャンセル
            self.timeLimitBar.layer.removeAllAnimations()
            performSegueToResult()
        } else {
            choiceQuiz()
            startTimer()
        }
    }
    
    //カウントダウンを開始させる
    func startTimer() {
        //タイムリミットバーで表示されているアニメーションを中止
        self.timeLimitBar.layer.removeAllAnimations()
        //タイムリミットバーの横幅を一番最初の幅にする
        timeLimitBar.frame.size.width = timeLimitBarWidth
        //アニメーション
        UIView.animate(
            //何秒間で実行されるのか
            withDuration: 10,
            delay: 0,
            options: .curveLinear,
            animations: {
                //タイムリミットバーの横幅を0にする
                self.timeLimitBar.frame.size.width = 0
            }, completion: { _ in
                //5秒たって回答していなかったらskipAnswerを実行
                if !self.answered {
                    self.skipAnswer()
                    self.answered = false
                }
            }
        )
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
