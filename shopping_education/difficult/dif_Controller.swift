//
//  dif_controller.swift
//  shopping_education
//
//  Created by 村上拓麻 on 2018/04/12.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit

class dif_controller: UIViewController {

    private let datas:[(product_name: String, price: Int,image: String)] = [
        ("オムライス",756,"オムライス.png"),("ホットドッグ",192,"ホットドック.png"),("エビフライ",341,"エビフライ.png"),
        ("ハンバーガー",665,"ハンバーガー.png"),("おすし",1856,"お寿司.png"),("トンカツ",108,"とんかつ.png"),
        ("ぎょうざ",324,"餃子.png"),("ステーキ",999,"ステーキ.png"),("パスタ",222,"パスタ.png"),
        ("おせち",1980,"おせち.png"),("あんぱん",358,"あんぱん.jpg"),("エクレア",546,"エクレア.png"),
        ("オムカレー",866,"オムカレー.png"),("カレー",354,"カレー.png"),("サラダ",555,"サラダ.png"),
        ("チョココロネ",432,"チョココロネ.png"),("メロンパン",544,"メロンパン.png")
    ]
    
    @IBOutlet var product_name: UILabel!
    @IBOutlet var product_image: UIImageView!
    @IBOutlet var judg_image: UIImageView!
    @IBOutlet var price_label: UILabel!
    @IBOutlet var result_label: UILabel!
    
    
    @IBOutlet var fivehundred_count_label: UILabel!
    @IBOutlet var hundred_count_label: UILabel!
    @IBOutlet var fifty_count_label: UILabel!
    @IBOutlet var ten_count_label: UILabel!
    @IBOutlet var five_count_label: UILabel!
    @IBOutlet var one_count_label: UILabel!
    
    
    
    var kakunin : Int = 0
    var pay : Int = 0
    var result_kazu : Int = 0 //正解数を管理する変数
    var question_kazu : Int = 0 //出題問題数を管理するための変数
    private var myButton : UIButton!  //問題が終わった時に次の問題へ行くためのボタン
    var random : Int = 0  //乱数を入れる変数
    
    
    var fivehundred : Int = 0
    var hundred : Int = 0
    var fifty : Int = 0
    var ten : Int = 0
    var five : Int = 0
    var one : Int = 0
    
    var fivehundred_count : Int = 0
    var hundred_count :Int = 0
    var fifty_count : Int = 0
    var ten_count : Int = 0
    var five_count : Int = 0
    var one_count : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random = Int(arc4random_uniform(16)) //乱数を設定し、これをもとに問題を出題する
        fivehundred_count = 0      //初期化
        hundred_count = 0
        fifty_count = 0
        ten_count = 0
        five_count = 0
        one_count = 0
        
        fivehundred = 500          //硬貨設定
        hundred = 100
        fifty = 50
        ten = 10
        five = 5
        one = 1
      
        questions()
        
        
        if question_kazu == 5{
          
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.result_num = result_kazu
            
            let vc = UIStoryboard(name:"end_story", bundle:nil).instantiateInitialViewController()!
            self.present(vc, animated: true)
            
        }
        
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
   
    func pay_over(){
        if pay == 0{
            fivehundred = 0
            hundred = 0
            fifty = 0
            ten = 0
            five = 0
            one = 0
        }
    }
    
    @IBAction func fivehundred_Button(_ sender: UIButton) {
        if pay > 0{
            fivehundred_count += 1
        }
        pay = (pay - fivehundred)
        
        if pay == 0 {
            result_label.text = "支払いが完了しました"
            pay_over()
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            
        }
        fivehundred_count_label.text = String(fivehundred_count)
        
    }
    
    @IBAction func hundred_Button(_ sender: UIButton) {
        if pay > 0{
            hundred_count += 1
        }
        pay = (pay - hundred)
        
        if pay == 0 {
            result_label.text = "支払い完了しました"
            pay_over()
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            
        }
        hundred_count_label.text = String(hundred_count)
    }
    
    @IBAction func fifty_Button(_ sender: UIButton) {
        if pay > 0{
            fifty_count += 1
        }
        pay = (pay - fifty)
        
        if pay == 0{
            result_label.text = "支払い完了しました"
            pay_over()
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            
        }
        fifty_count_label.text = String(fifty_count)
    }
    
    @IBAction func ten_Button(_ sender: UIButton) {
        if pay > 0{
            ten_count += 1
        }
        pay = (pay - ten)
        
        if pay == 0{
            result_label.text = "支払い完了しました"
            pay_over()
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            
        }
        ten_count_label.text = String(ten_count)
    }
    
    @IBAction func five_Button(_ sender: UIButton) {
        if pay > 0{
            five_count += 1
        }
        
        pay = (pay - five)
        
        if pay == 0{
            result_label.text = "支払い完了しました"
            pay_over()
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            
        }
        five_count_label.text = String(five_count)
    }
    
    @IBAction func one_Button(_ sender: UIButton) {
        if pay > 0{
            one_count += 1
        }
        
        pay = (pay - one)
        
        if pay == 0{
            result_label.text = "支払い完了しました"
            pay_over()
            judg_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0{
            result_label.text = "払い過ぎです"
            pay_over()
            judg_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            
        }
        one_count_label.text = String(one_count)
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
        
        myButton.addTarget(self, action: #selector(dif_controller.onClickMyButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(myButton)
    }
    
    
    
    
    @objc internal func onClickMyButton(sender: UIButton) {
        
        question_kazu += 1      //出題問題数をカウント
        result_kazu += kakunin      //正解数をカウント
        loadView()              //画面をリロード
        viewDidLoad()           //viewdidloadを呼び出す
        
    }
    
    
    
    
    

    
}
