////
////  easy1.swift
////  educationApp
////
////  Created by 村上拓麻 on 2017/12/06.
////  Copyright © 2017年 村上拓麻. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//
//class easy1: UIViewController {
//
//
//    @IBOutlet weak var actionImage: UIImageView!
//    @IBOutlet weak var namaeLabel: UILabel!
//    @IBOutlet weak var daikinLabel: UILabel!
//    @IBOutlet weak var hyouziLabel: UILabel!        //支払い完了かどうか表示
//    @IBOutlet weak var hyouziImage: UIImageView!
//
//    @IBOutlet weak var gohyakuLabel: UILabel!
//    @IBOutlet weak var hyakuLabel: UILabel!
//
//
//
//
//    var talker = AVSpeechSynthesizer()
//
//    let random = arc4random_uniform(16)     //乱数を生成
//    var result: Int = 0       //変数を初期化
//    var i: Int = 0      //resultを代入
//    var pay: Int = 0 //代金
//    var kawari: Int = 0
//    private var myButton: UIButton! //追加
//    var one: Int = 1
//    var five: Int = 500     //500円
//    var thousand: Int = 100     //100円
//
//    //   var correctAnswerNum: Int = 0        //何回正解したか回数を代入
//    // var currentQuestionNum: Int = 0     //何回問題を行なったかの回数を代入
//    var count1: Int = 0        //500円のボタンが何回押されたかをこれに代入
//    var count2: Int = 0        //100円の場合
//
//    var audioPlayerInstance_true : AVAudioPlayer! = nil  // 正解音のインスタンス
//    var audioPlayerInstance_false : AVAudioPlayer! = nil
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        ransu()
//
//
//        let soundFilePath = Bundle.main.path(forResource: "true_sound", ofType: "mp3")!
//        let sound:URL = URL(fileURLWithPath: soundFilePath)
//        // AVAudioPlayerのインスタンスを作成
//        do {
//            audioPlayerInstance_true = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
//        } catch {
//            print("AVAudioPlayerインスタンス作成失敗")
//        }
//
//        let soundFilePath_false = Bundle.main.path(forResource: "false_sound", ofType:"mp3")!
//        let sound_false:URL = URL(fileURLWithPath: soundFilePath_false)
//
//        do {
//            audioPlayerInstance_false = try AVAudioPlayer(contentsOf: sound_false, fileTypeHint:nil)
//        } catch {
//            print("AVAudioPlayerインスタンス作成失敗")
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//
//    func ransu(){
//        /*
//         let random11 = arc4random_uniform(UInt32(range)) + UInt32(min)      //乱数を生成
//         let random22 = arc4random_uniform(UInt32(range)) + UInt32(min)
//         let random33 = arc4random_uniform(UInt32(range)) + UInt32(min)
//         */
//        result = Int(random)            //乱数をInt型に変換して代入
//        //print(result)
//
//
//        i = result
//
//        var strArray: [String]
//        // 空配列を入れないとエラーになる
//        strArray = []
//        strArray.append("キウイ")       //0
//        strArray.append("みかん")      //1
//        strArray.append("レモン")      //2
//        strArray.append("さくらんぼ")        //3
//        strArray.append("スイカ")      //4
//        strArray.append("バナナ")      //5
//        strArray.append("ようなし")      //6
//        strArray.append("もも")           //7
//        strArray.append("メロン")          //8
//        strArray.append("りんご")          //9
//        strArray.append("ピーマン")     //10
//        strArray.append("トマト")              //11
//        strArray.append("かぼちゃ")         //12
//        strArray.append("しいたけ")         //13
//        strArray.append("にんじん")         //14
//        strArray.append("さつまいも")            //15
//        strArray.append("じゃがいも")            //16
//
//
//        switch i{
//        case 0:
//            self.hyouziImage.image = UIImage(named: "kiui.png")
//            pay = 300
//            daikinLabel.text = "300円です"
//        case 1:
//            self.hyouziImage.image = UIImage(named: "mikan.png")
//            pay = 200
//            daikinLabel.text = "200円です"
//        case 2:
//            self.hyouziImage.image = UIImage(named: "remon.png")
//            pay = 500
//            daikinLabel.text = "500円です"
//        case 3:
//            self.hyouziImage.image = UIImage(named: "sakuranbo.png")
//            pay = 600
//            daikinLabel.text = "600円です"
//        case 4:
//            self.hyouziImage.image = UIImage(named: "suika.png")
//            pay = 800
//            daikinLabel.text = "800円です"
//        case 5:
//            self.hyouziImage.image = UIImage(named: "banana.png")
//            pay = 400
//            daikinLabel.text = "400円です"
//        case 6:
//            self.hyouziImage.image = UIImage(named: "younasi1.png")
//            pay = 700
//            daikinLabel.text = "700円です"
//        case 7:
//            self.hyouziImage.image = UIImage(named: "momo.png")
//            pay = 900
//            daikinLabel.text = "900円です"
//        case 8:
//            self.hyouziImage.image = UIImage(named: "meron.png")
//            pay = 1000
//            daikinLabel.text = "1000円です"
//        case 9:
//            self.hyouziImage.image = UIImage(named: "ringo.png")
//            pay = 100
//            daikinLabel.text = "100円です"
//        case 10:
//            self.hyouziImage.image = UIImage(named: "ピーマン.png")
//            pay = 200
//            daikinLabel.text = "200円だよ"
//        case 11:
//            self.hyouziImage.image = UIImage(named: "トマト.png")
//            pay = 300
//            daikinLabel.text = "300円だよ"
//        case 12:
//            self.hyouziImage.image = UIImage(named: "かぼちゃ.png")
//            pay = 600
//            daikinLabel.text = "600円だよ"
//        case 13:
//            self.hyouziImage.image = UIImage(named: "しいたけ.png")
//            pay = 400
//            daikinLabel.text = "400円だよ"
//        case 14:
//            self.hyouziImage.image = UIImage(named: "人参.png")
//            pay = 800
//            daikinLabel.text = "800円だよ"
//        case 15:
//            self.hyouziImage.image = UIImage(named: "さつまいも.png")
//            pay = 900
//            daikinLabel.text = "900円だよ"
//        case 16:
//            self.hyouziImage.image = UIImage(named: "じゃがいも.png")
//            pay = 600
//            daikinLabel.text = "600円だよ"
//        default:
//            break
//        }
//
//        namaeLabel.text = strArray[i]       //商品名を表示
//
//
//        // 話す内容をセット
//        var aa: String = String(strArray[i])
//        let utterance = AVSpeechUtterance(string: aa)       //自動読み上げ
//        // 言語を日本に設定
//        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
//        // 実行
//        self.talker.speak(utterance)
//
//
//    }
//
//    @IBAction func gohyakuButton(_ sender: UIButton) {
//        if pay > 0{
//            count1 += 1
//        }
//        pay = pay - five
//        gohyakuLabel.text = ("×\(count1)")
//        if pay == 0{
//
//            audioPlayerInstance_true.currentTime = 0     //正解音の音量を設定
//            audioPlayerInstance_true.play()              //音声再生
//
//            hyouziLabel.text = "支払い完了しました"
//            syori()
//            self.actionImage.image = UIImage(named: "maru.png")
//            zero()
//
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.kazu = 1
//
//        }else if pay < 0{
//            audioPlayerInstance_false.currentTime = 0      //不正解音の音量を設定
//            audioPlayerInstance_false.play()
//            hyouziLabel.text = "払い過ぎです"
//            syori()
//            self.actionImage.image = UIImage(named: "batu.png")
//
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.kazu = 0
//        }
//
//
//    }
//
//
//    @IBAction func hyokuButton(_ sender: UIButton) {
//
//
//        if pay > 0{
//            count2 += 1
//        }
//
//
//        pay = pay - thousand
//        var countString :String = String(count2)
//        hyakuLabel.text = ("×\(countString)")
//
//        if pay == 0{
//
//
//
//            audioPlayerInstance_true.currentTime = 0     //正解音の音量を設定
//            audioPlayerInstance_true.play()              //音声再生
//
//
//
//            hyouziLabel.text = "支払い完了しました"
//            syori()
//            self.actionImage.image = UIImage(named: "maru.png")
//            zero()
//
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.kazu = 1
//
//        }else if pay < 0{
//
//            audioPlayerInstance_false.currentTime = 0      //不正解音の音量を設定
//            audioPlayerInstance_false.play()
//
//
//            hyouziLabel.text = "払い過ぎです"
//            syori()
//            self.actionImage.image = UIImage(named: "batu.png")
//
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.kazu = 0
//        }
//
//    }
//
//
//
//
//
//
//
//
//    func syori(){
//        // Buttonを生成する.
//        myButton = UIButton()
//
//        // ボタンのサイズ.
//        let bWidth: CGFloat = 200
//        let bHeight: CGFloat = 50
//
//        // ボタンのX,Y座標.
//        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
//        let posY: CGFloat = self.view.frame.height/1.3 - bHeight/1.3
//
//        // ボタンの設置座標とサイズを設定する.
//        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
//
//        // ボタンの背景色を設定.
//        myButton.backgroundColor = UIColor.red
//
//        // ボタンの枠を丸くする.
//        myButton.layer.masksToBounds = true
//
//        // コーナーの半径を設定する.
//        myButton.layer.cornerRadius = 20.0
//
//        // タイトルを設定する(通常時).
//        myButton.setTitle("次の問題へ", for: .normal)
//        myButton.setTitleColor(UIColor.white, for: .normal)
//
//        // タイトルを設定する(ボタンがハイライトされた時).
//        myButton.setTitle("できるかな？", for: .highlighted)
//        myButton.setTitleColor(UIColor.black, for: .highlighted)
//
//        // ボタンにタグをつける.
//        myButton.tag = 1
//
//        // イベントを追加する
//        myButton.addTarget(self, action: #selector(easy1.onClickMyButton(sender:)), for: .touchUpInside)
//
//        // ボタンをViewに追加.
//        self.view.addSubview(myButton)
//
//    }
//
//
//    @objc internal func onClickMyButton(sender: UIButton) {
//        /*  print("onClickMyButton:");
//         print("sender.currentTitle: \(String(describing: sender.currentTitle))")
//         print("sender.tag: \(sender.tag)")*/
//
//
//        let targetViewController = self.storyboard!.instantiateViewController( withIdentifier: "easy11" )
//        self.present( targetViewController, animated: true, completion: nil)
//
//    }
//
//    func zero(){
//
//        if pay == 0{        //正解していて支払いボタンを押しても間違いと表示させないための処理
//            five = 0    //500円
//            thousand = 0     //100円
//
//        }
//    }
//
//
//
//
//    /*
//     func tensyori(){
//     kawari = pay
//
//     if kawari < 0{
//     hyouziLabel.text = "払い過ぎです"
//     }
//
//     }
//     */
//
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destinationViewController.
//     // Pass the selected object to the new view controller.
//     }
//     */
//
//}
//
//
