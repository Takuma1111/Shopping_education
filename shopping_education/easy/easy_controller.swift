//
//  easy_controller.swift
//  shopping_education
//
//  Created by 村上拓麻 on 2018/04/12.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit

class easy_controller: UIViewController {


    @IBOutlet var name_Label: UILabel!  //商品名を表示
    @IBOutlet var action_image: UIImageView!    //マルかバツの画像を表示
    @IBOutlet var hyouziImage: UIImageView!       //商品の画像を表示
    @IBOutlet var daikinLabel: UILabel!         //商品の値段を表示
    @IBOutlet var hyouziLabel: UILabel!         //支払いが完了したかどうかを表示
    var pay : Int = 0   //代金を計算するための変数
    var result_kazu: Int = 0 //正解数を管理する変数
    var question_kazu: Int = 0 //出題問題数を管理するための変数
    private var myButton: UIButton!  //問題が終わった時に次の問題へ行くためのボタン
    var five: Int = 0
    var hundred: Int = 0
    var kakunin: Int = 0 //正解した時にボタンを連打したら正解数が増えるのでこの変数に正解したら1を入れ、不正解だったら0を入れ、最後の
                        //ボタンを押して移動する時に別の正解数を管理する変数に加える
    
    @IBOutlet var gohyaku_count: UILabel!
    @IBOutlet var hyaku_count: UILabel!
    var count_five:Int = 0
    var count_hyaku: Int = 0
   
    //商品データを設定
    private let datas:[(product_name: String, price: Int,image: String)] = [
        ("キウイ",300,"kiui.png"),("みかん",200,"mikan.png"),("レモン",500,"remon.png"),
        ("さくらんぼ",600,"sakuranbo.png"),("スイカ",800,"suika.png"),("バナナ",400,"banana.png"),
        ("ようナシ",700,"younasi1.png"),("もも",900,"momo.png"),("メロン",1000,"meron.png"),
        ("りんご",100,"ringo.png"),("ピーマン",200,"ピーマン.png"),("トマト",300,"トマト.png"),
        ("かぼちゃ",600,"かぼちゃ.png"),("しいたけ",400,"しいたけ.png"),("にんじん",800,"人参.png"),
        ("さつまいも",900,"さつまいも.png"),("ジャガイモ",600,"じゃがいも.png")
    ]
    
    
    var random: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random = Int(arc4random_uniform(16)) //乱数を設定し、これをもとに問題を出題する
    
        five = 500
        hundred = 100
        count_five = 0
        count_hyaku = 0
        
        print("乱数:",random)
        print("商品名:",datas[random].product_name)
        print("価格:",datas[random].price)
        print("出題数:",question_kazu)
        questions()      //問題出題の処理を呼び出す
        if question_kazu == 5{
            print("問題が終わった")
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.result_num = result_kazu
            
            let vc = UIStoryboard(name: "end_story", bundle: nil).instantiateInitialViewController()!
            self.present(vc, animated: true)
            
        }else{

        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func questions(){
        let i = Int(random)
        
        name_Label.text = datas[i].product_name       //商品名を表示
        pay = datas[i].price                //値段を設定
        daikinLabel.text = "\(datas[i].price)です"       //商品名を設定
        hyouziImage.image = UIImage(named: "\(datas[i].image)") //商品の画像を設定
    }
    
    @IBAction func gohyakuButton(_ sender: UIButton) {
       
        if pay > 0{
            count_five += 1      //何枚支払ったか枚数をカウント
        }
        
       pay = (pay - five)
        
       gohyaku_count.text = "\(String(count_five))" //何枚支払ったか枚数を表示
        
        if pay == 0{
            hyouziLabel.text = "支払い完了しました"
            pay_over()
            action_image.image = UIImage(named: "maru.png") //正解した時の画像を表示
            kakunin = 1
            new_button()            //次の問題へ行くためにボタンを呼び出す
        }else if pay < 0{
            self.hyouziLabel.text = "払い過ぎです"
            self.pay_over()
            self.action_image.image = UIImage(named: "batu.png")
            kakunin = 0
            self.new_button()            //次の問題へ行くためにボタンを呼び出す
        }else{
            print("500ボタンの処理エラー")
        }
    }
    
    
    @IBAction func hyakuButton(_ sender: UIButton) {
        
        if pay > 0{
            count_hyaku += 1
        }
        
        print(pay)
        pay = (pay - hundred)
        print(pay)
        hyaku_count.text = "\(String(count_hyaku))"
        
        if pay == 0{
            hyouziLabel.text = "支払い完了しました"
            pay_over()      //ボタンを押して払いすぎて不正解にならないように
            action_image.image = UIImage(named: "maru.png")
            kakunin = 1
            new_button()
        }else if pay < 0 {
            hyouziLabel.text = "払い過ぎです"
            pay_over()
            action_image.image = UIImage(named: "batu.png")
            kakunin = 0
            new_button()
        }else{
            print("100ボタンの処理エラーです")
        }
    }
    
    func pay_over(){        //問題が正解して支払いボタンを押しても間違いと表示させないための処理
        if pay == 0{
            five = 0
            hundred = 0
        }
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
        
        myButton.addTarget(self, action: #selector(easy_controller.onClickMyButton(sender:)), for: .touchUpInside)
        
        self.view.addSubview(myButton)
    }

    
    
    @objc internal func onClickMyButton(sender: UIButton) {
      
        question_kazu += 1      //出題問題数をカウント
        result_kazu += kakunin      //正解数をカウント
        loadView()              //画面をリロード
        viewDidLoad()           //viewdidloadを呼び出す
        
    }
    
}
