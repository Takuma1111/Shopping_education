//
//  easy_end.swift
//  shopping_education
//
//  Created by 村上拓麻 on 2018/04/14.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit

class end: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var left_Image: UIImageView!
    @IBOutlet var rightImage: UIImageView!
    @IBOutlet var commentLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appdelegate = UIApplication.shared.delegate as! AppDelegate
       
        resultLabel.text = String(describing: appdelegate.result_num!)
        judg()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func judg(){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        if appdelegate.result_num! < 3{
            self.left_Image.image = UIImage(named: "study-man.png")
            self.rightImage.image = UIImage(named: "study-garl.png")
            commentLabel.text = "次はもう少し頑張ろう！！"
        }else{
            self.left_Image.image = UIImage(named: "kurakka-Left.png")
            self.rightImage.image = UIImage(named: "kurakka-right.png")
            commentLabel.text = "よくできました！！"
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
       
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
