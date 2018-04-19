//
//  normal_controller.swift
//  shopping_education
//
//  Created by 村上拓麻 on 2018/04/12.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit
import AVFoundation


class normal_controller: UIViewController {

    
    private let datas:[(product_name: String, price: Int,image: String)] = [
        ("ゼリー",350,"ゼリー.png"),("ホットケーキ",130,"ホットケーキ.png"),("ドーナツ",550,"ドーナツ.png"),
        ("アイスクリーム",630,"アイスクリーム.png"),("プリン",870,"プリン.png"),("クッキー",870,"クッキー.png"),
        ("マカロン",720,"マカロン.png"),("ケーキ",990,"ケーキ.png"),("エクレア",1100,"エクレア.png"),
        ("わたあめ",230,"綿菓子.png"),("アメ",130,"アメ.png"),("おはぎ",210,"おはぎ.png"),
        ("あんぱん",120,"あんぱん.jpg"),("カステラ",560,"カステラ.png"),("マフィン",230,"マフィン.png"),
        ("ティラミス",330,"ティラミス.png"),("シュークリーム",880,"シュークリーム.png")
    ]
    
    @IBOutlet var product_name: UILabel!
    @IBOutlet var product_image: UIImageView!
    @IBOutlet var judg_image: UIImageView!
    @IBOutlet var price_label: UILabel!
    @IBOutlet var result_label: UILabel!
    
    var audioPlayerInstance_true : AVAudioPlayer! = nil  // 正解音のインスタンス
    var audioPlayerInstance_false : AVAudioPlayer! = nil    //不正解音のインスタンス
    
    var talker = AVSpeechSynthesizer()  //自動読み上げ
    
    
    @IBOutlet var fivecount_label: UILabel!
    @IBOutlet var hundredcount_label: UILabel!
    @IBOutlet var fiftycount_label: UILabel!
    @IBOutlet var tencount_label: UILabel!
    
    
    var kakunin : Int = 0
    var pay : Int = 0
    var result_kazu: Int = 0 //正解数を管理する変数
    var question_kazu: Int = 0 //出題問題数を管理するための変数
    private var myButton: UIButton!  //問題が終わった時に次の問題へ行くためのボタン
    var random: Int = 0  //乱数を入れる変数
    
    
    var five: Int = 0
    var hundred: Int = 0
    var fifty: Int = 0
    var ten : Int = 0
    
    
    var five_count : Int = 0
    var hundred_count :Int = 0
    var fifty_count : Int = 0
    var ten_count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random = Int(arc4random_uniform(16)) //乱数を設定し、これをもとに問題を出題する
        five_count = 0      //初期化
        hundred_count = 0
        fifty_count = 0
        ten_count = 0
        
        five = 500          //硬貨設定
        hundred = 100
        fifty = 50
        ten = 10
        
        questions()
        
        print("乱数:",random)
        print("商品名:",datas[random].product_name)
        print("価格:",datas[random].price)
        print("出題数:",question_kazu)
        
        if question_kazu == 5{
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.result_num = result_kazu
            
            let vc = UIStoryboard(name:"end_story", bundle:nil).instantiateInitialViewController()!
            self.present(vc, animated: true)
        }
        
        
        
        let soundFilePath = Bundle.main.path(forResource: "true_sound", ofType: "mp3")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        // AVAudioPlayerのインスタンスを作成
        do {
            audioPlayerInstance_true = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("AVAudioPlayerインスタンス作成失敗")
        }
        
        let soundFilePath_false = Bundle.main.path(forResource: "false_sound", ofType:"mp3")!
        let sound_false:URL = URL(fileURLWithPath: soundFilePath_false)
        
        do {
            audioPlayerInstance_false = try AVAudioPlayer(contentsOf: sound_false, fileTypeHint:nil)
        } catch {
            print("AVAudioPlayerインスタンス作成失敗")
        }
        
        
        // 話す内容をセット
        var aa: String = String(datas[random].product_name)
        let utterance = AVSpeechUtterance(string: aa)       //自動読み上げ
        // 言語を日本に設定
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // 実行
        self.talker.speak(utterance)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func questions(){
        product_name.text = datas[random].product_name
        pay = datas[random].price
        price_label.text = "\(datas[random].price)です"
        product_image.image = UIImage(named: "\(datas[random].image)")
    }
    
    
    func pay_over(){        //問題が正解して支払いボタンを押しても間違いと表示させないための処理
        if pay == 0{
            five = 0
            hundred = 0
            fifty = 0
            ten = 0
        }
    }
    
    
    
    @IBAction func five_Button(_ sender: UIButton) {
        if pay > 0{
            five_count += 1
        }
        
        pay = (pay - five)
       
         if pay == 0{
            result_label.text = "支払い完了しました"
            pay_over()
            
            audioPlayerInstance_true.currentTime = 0
            audioPlayerInstance_true.play()
            
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            
            audioPlayerInstance_false.currentTime = 0
            audioPlayerInstance_false.play()
            
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
        }
         fivecount_label.text = String(five_count)
    }
    
    
    @IBAction func hundred_Button(_ sender: UIButton) {
        if pay > 0{
            hundred_count += 1
        }
        pay = (pay - hundred)
        if pay == 0 {
            result_label.text = "支払い完了しました"
            pay_over()
            
            audioPlayerInstance_true.currentTime = 0
            audioPlayerInstance_true.play()
            
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            
            audioPlayerInstance_false.currentTime = 0
            audioPlayerInstance_false.play()
            
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            
        }
         hundredcount_label.text = String(hundred_count)
    }
    
    @IBAction func fifty_Button(_ sender: UIButton) {
        if pay > 0{
            fifty_count += 1
        }
        pay = (pay - fifty)
         if pay == 0 {
            result_label.text = "支払い完了しました"
            pay_over()
            
            audioPlayerInstance_true.currentTime = 0
            audioPlayerInstance_true.play()
            
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            
            audioPlayerInstance_false.currentTime = 0
            audioPlayerInstance_false.play()
            
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }
        fiftycount_label.text = String(fifty_count)
    }
    
    @IBAction func ten_Button(_ sender: UIButton) {
        if pay > 0{
            ten_count += 1
        }
        pay = (pay - ten)
         if pay == 0 {
            result_label.text = "支払い完了しました"
            pay_over()
            
            audioPlayerInstance_true.currentTime = 0
            audioPlayerInstance_true.play()
            
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0 {
            result_label.text = "払い過ぎです"
            pay_over()
            
            audioPlayerInstance_false.currentTime = 0
            audioPlayerInstance_false.play()
            
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }
          tencount_label.text = String(ten_count)
    }
    
    
    
    
    func new_button(){
        myButton = UIButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/1.3 - bHeight/1.3
        
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        myButton.backgroundColor = UIColor.red
        
        myButton.layer.masksToBounds = true
        
        myButton.layer.cornerRadius = 20.0
        
        myButton.setTitle("次の問題へ", for: .normal)
        
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        myButton.setTitle("できるかな？", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        
        myButton.tag = 1
        
        myButton.addTarget(self, action: #selector(normal_controller.onClickMyButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(myButton)
    }
    
    
    
    @objc internal func onClickMyButton(sender: UIButton) {
        
        question_kazu += 1      //出題問題数をカウント
        result_kazu += kakunin      //正解数をカウント
        loadView()              //画面をリロード
        viewDidLoad()           //viewdidloadを呼び出す
        
    }
}
